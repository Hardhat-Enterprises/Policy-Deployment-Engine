#!/usr/bin/env python3
"""Lint gate: run the linter but only fail on the author's *own* changes.

The linter (scripts/linters/linter.py) is whole-tree by design — it must build
the full docs index to reconcile inputs/ and policies/ against it, so it cannot
meaningfully lint a single file in isolation. To hold contributors to their own
work *without* blocking them on the repo-wide backlog, we run the linter once
over the whole tree (with --content-checks) and fail only on error lines whose
path intersects the changed set. Pre-existing errors elsewhere are reported as a
count but never block.

The same "own it, don't block on the backlog" treatment applies to
``policy_lint`` (scripts/linters/policy_lint.py): every resource type touched
under policies/ or inputs/ is content-linted, but an individual finding only
fails the run when the .rego file (or, for a fixture finding, the argument
directory) it names was itself changed — a sibling argument's pre-existing
finding never blocks you. See Guide/Policy_writing_tutorial/policy-lint.md.

Modes (run from the repo root):
  (no args)         pre-commit: changed set = staged + unstaged worktree edits
  --base <ref>      CI/PR:      changed set = everything this branch changed vs
                                the merge-base with <ref> (e.g. origin/dev)
  --all             maintainer: no filter — fail on ANY error in the tree
"""
import os
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO_ROOT))

from scripts.linters import policy_lint  # noqa: E402

LINTER = [sys.executable, os.path.join("scripts", "linters", "linter.py"),
          "--tree", "all", "--platform", "gcp", "--content-checks"]
RELEVANT_PREFIXES = ("docs/", "inputs/", "policies/")

# Findings about the fixture pair itself (compliant.tf/nonCompliant.tf), as
# opposed to a policy .rego file — displayed and owned via the argument
# directory under inputs/, not a single policy file.
FIXTURE_RULES = {"fixture-drift", "fixture-missing-plan"}


def _git(*args):
    out = subprocess.run(["git", *args], capture_output=True, text=True)
    return [ln for ln in out.stdout.splitlines() if ln]


def changed_files(base=None):
    """Changed paths (normalised). vs merge-base(base) for CI, else staged+unstaged."""
    if base:
        mb = subprocess.run(["git", "merge-base", "HEAD", base],
                            capture_output=True, text=True)
        ref = mb.stdout.strip() if mb.returncode == 0 and mb.stdout.strip() else base
        files = set(_git("diff", "--name-only", ref))
    else:
        files = set(_git("diff", "--cached", "--name-only"))   # staged (this commit)
        files |= set(_git("diff", "--name-only"))              # unstaged worktree
    return {f.replace("\\", "/") for f in files}


def _owns_error(error_path, owned_path):
    """True if the contributor (who owns ``owned_path``) is accountable for an
    error reported at ``error_path``.

    Ownership flows *downward only*: you own errors at your path or anything
    beneath it, but NOT errors reported on an ancestor directory you merely live
    under (e.g. a structural error on the whole resource dir must not be blamed
    on someone who only touched one argument dir below it)."""
    error_path, owned_path = error_path.rstrip("/"), owned_path.rstrip("/")
    return error_path == owned_path or error_path.startswith(owned_path + "/")


def _owned(changed):
    """The set of paths a contributor is accountable for.

    A contributor owns every file they changed. For input fixtures they also own
    the whole *argument directory*: compliant.tf and nonCompliant.tf test one
    argument together, so touching one means owning the pair (and config.tf).
    Policies/docs stay file-level — each policy/doc is an independent unit.
    """
    owned = set(changed)
    for f in changed:
        if f.startswith("inputs/") and "/" in f:
            owned.add(f.rsplit("/", 1)[0])   # the argument directory
    return owned


def _owned_triples(changed):
    """(platform, service, resource_type) triples policy_lint should check.

    Any changed file at least 4 segments deep under ``policies/`` or
    ``inputs/`` puts its resource type in scope for ``policy_lint`` — the
    individual *findings* are then scoped back down to the argument or
    fixture pair actually touched by ``_finding_owned``, so touching one
    argument does not put a sibling argument's pre-existing findings on you.
    """
    triples = set()
    for f in changed:
        parts = f.split("/")
        if len(parts) >= 4 and parts[0] in ("policies", "inputs"):
            triples.add((parts[1], parts[2], parts[3]))
    return triples


def _finding_path(platform, service, resource_type, finding):
    """The policy file (or, for a fixture finding, the argument directory)
    a ``policy_lint`` finding is about."""
    base = f"{platform}/{service}/{resource_type}"
    if finding.rule in FIXTURE_RULES:
        return f"inputs/{base}/{finding.policy}"
    name = "_vars.rego" if finding.policy == "_vars" else f"{finding.policy}.rego"
    return f"policies/{base}/{name}"


def _finding_owned(path, changed):
    """True if ``path`` (a file, or a fixture argument directory) is among
    ``changed`` — either changed directly, or (for a directory) it has a
    changed file beneath it."""
    return path in changed or any(c == path or c.startswith(path + "/") for c in changed)


def _policy_lint_findings(triples, changed, root=REPO_ROOT):
    """Error-severity ``policy_lint`` findings for ``triples``, split into
    ``(owned, backlog_count)``.

    ``owned`` is a list of ``(path, Finding)`` pairs whose file was itself
    changed; everything else (a sibling argument's pre-existing error, or a
    warning) is counted in ``backlog_count`` but never attributed.
    """
    owned, backlog = [], 0
    for platform, service, resource_type in sorted(triples):
        for finding in policy_lint.lint_resource(root, platform, service, resource_type):
            if finding.severity != "error":
                continue
            path = _finding_path(platform, service, resource_type, finding)
            if _finding_owned(path, changed):
                owned.append((path, finding))
            else:
                backlog += 1
    return owned, backlog


def _error_path(line):
    """Extract the file/dir path from a '[ERROR] [content] <path>: msg' line."""
    s = line[len("[ERROR]"):].strip()
    if s.startswith("[content]"):
        s = s[len("[content]"):].strip()
    return s.split(":", 1)[0].strip()


def main(argv=None):
    argv = sys.argv[1:] if argv is None else argv
    lint_all = "--all" in argv
    base = None
    if "--base" in argv:
        i = argv.index("--base")
        if i + 1 >= len(argv) or argv[i + 1].startswith("--"):
            print("[ERROR] --base requires a value, e.g. --base origin/dev.")
            return 2
        base = argv[i + 1]

    changed = None
    if not lint_all:
        changed = {f for f in changed_files(base) if f.startswith(RELEVANT_PREFIXES)}
        if not changed:
            print("No docs/ inputs/ policies/ changes — skipping linter.")
            return 0
        print("Linting your changed files under docs/ inputs/ policies/:")
        for f in sorted(changed):
            print(f"  {f}")

    result = subprocess.run(LINTER, capture_output=True, text=True)
    # The linter exits 1 when it finds lint errors and 2 on a config error (a
    # missing tree root). Only 0/1 mean "the run is trustworthy"; surface 2+ as a
    # hard failure rather than parsing stdout and reporting a clean run.
    if result.returncode not in (0, 1):
        print("[FAIL] linter could not run (configuration error):\n")
        print(result.stdout)
        print(result.stderr)
        return result.returncode
    errors = [ln for ln in result.stdout.splitlines() if ln.startswith("[ERROR]")]
    if lint_all:
        mine, backlog = errors, 0
    else:
        owned = _owned(changed)
        mine = [ln for ln in errors if any(_owns_error(_error_path(ln), o) for o in owned)]
        backlog = len(errors) - len(mine)

    if mine:
        print("\n[FAIL] lint error(s) you must fix:\n")
        for ln in mine:
            print(f"  {ln}")
        if backlog:
            print(f"\n({backlog} pre-existing error(s) elsewhere are not attributed to you.)")
        return 1

    # policy_lint: content-quality rules (hard-coded values, trivial messages,
    # fixture drift, ...) over the resource types this change touches. Only
    # runs in changed-files modes — `--all` stays a linter.py-only, structural
    # + reconciliation gate.
    policy_lint_owned, policy_lint_backlog = [], 0
    if changed is not None:
        triples = _owned_triples(changed)
        if triples:
            try:
                policy_lint_owned, policy_lint_backlog = _policy_lint_findings(triples, changed)
            except policy_lint.PolicyLintError as exc:
                print(f"\n[FAIL] policy_lint could not run: {exc}")
                return 1

    if policy_lint_owned:
        print("\n[FAIL] policy_lint error(s) you must fix:\n")
        for path, finding in policy_lint_owned:
            print(f"  {finding.rule}: {path} — {finding.message}")
        if policy_lint_backlog:
            print(f"\n({policy_lint_backlog} pre-existing policy_lint error(s) elsewhere "
                  "are not attributed to you.)")
        return 1

    suffix = f" ({backlog} pre-existing backlog error(s) elsewhere ignored)" if backlog else ""
    if policy_lint_backlog:
        suffix += (f"; {policy_lint_backlog} pre-existing policy_lint backlog error(s) "
                   "elsewhere ignored")
    print(f"\n[OK] no lint errors in scope{suffix}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
