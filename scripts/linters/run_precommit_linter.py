#!/usr/bin/env python3
"""Lint gate: run the linter but only fail on the author's *own* changes.

The linter (scripts/linters/linter.py) is whole-tree by design — it must build
the full docs index to reconcile policies/ against it, so it cannot
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

Within a file you did touch, ``policy_lint`` goes one step further: a finding
only fails the run when your change *introduced* it. The same resource types are
linted a second time against the **base** tree — a detached ``git worktree`` of
the merge-base, thrown away afterwards — and anything already there is reported
as inherited context rather than as your fault. Removing findings can therefore
never fail.

A finding is identified by ``(rule, service, resource, policy)``, deliberately
NOT including the message: messages carry line numbers and counts that shift
when a file is legitimately edited, and a shifted message must not read as a new
problem. Identities are compared by *count*, so going from one hard-coded value
in a file to two still fails.

The base run is not free, so it is bought only where it can pay: only the
resource types that actually produced a finding you own at HEAD are linted on
the base tree, and when your change is clean the base tree is never built at all.

Modes (run from the repo root):
  (no args)         pre-commit: changed set = staged + unstaged worktree edits
  --base <ref>      CI/PR:      changed set = everything this branch changed vs
                                the merge-base with <ref> (e.g. origin/dev)
  --all             maintainer: no filter — fail on ANY error in the tree
"""
import contextlib
import os
import shutil
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO_ROOT))

from scripts.linters import policy_lint  # noqa: E402

LINTER = [sys.executable, os.path.join("scripts", "linters", "linter.py"),
          "--tree", "all", "--platform", "gcp", "--content-checks"]
RELEVANT_PREFIXES = ("docs/", "policies/")
# The files that make up one argument policy; touching any of them means owning
# the whole argument directory (see _owned).
ARGUMENT_FILES = {"policy.rego", "compliant.tf", "nonCompliant.tf"}

# Findings about the fixture pair itself (compliant.tf/nonCompliant.tf), as
# opposed to a policy .rego file — displayed and owned via the argument
# directory under inputs/, not a single policy file.
#
# fixture-one-sided belongs here for the same reason as the other two, and its
# absence was a real bug under the old name (fixture-unpaired): the finding is
# about inputs/, so leaving it out blamed it on a .rego file the contributor may
# never have touched. It fires 0 times on the tree today, so this closes a trap
# set for whoever first writes a fixture with nothing on one side.
FIXTURE_RULES = {"fixture-drift", "fixture-missing-plan", "fixture-one-sided"}

# How many inherited findings to list before eliding the rest. They are context,
# not work items: enough to prove the problem is real and show where it lives,
# not so many that they bury the findings the contributor must actually fix.
INHERITED_PREVIEW = 10


class BaseTreeUnavailable(RuntimeError):
    """The tree this change is measured against could not be materialised.

    Always fatal, never "assume it is all new": a shallow CI clone that cannot
    reach the base commit would otherwise silently blame the contributor for the
    entire pre-existing backlog of every file they touched — the exact failure
    this gate exists to prevent.
    """


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

    A contributor owns every file they changed. For an argument policy they also own
    the whole *argument directory*: policy.rego, compliant.tf and nonCompliant.tf test
    one argument together, so touching one means owning all three. Docs and the
    per-resource _vars.rego stay file-level — each is an independent unit.
    """
    owned = set(changed)
    for f in changed:
        if f.startswith("policies/") and f.rsplit("/", 1)[-1] in ARGUMENT_FILES:
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


# --------------------------------------------------------------------------- #
# "Did this change introduce it?" — the base-tree comparison
# --------------------------------------------------------------------------- #
def _finding_key(finding):
    """The identity of a ``policy_lint`` finding for base-vs-head comparison.

    ``(rule, service, resource, policy)`` — deliberately WITHOUT the message.
    Messages carry line numbers and counts ("2 conditions", "differ on: x, y")
    that shift when a file is legitimately edited, and a shifted message must
    not read as a new problem.
    """
    return (finding.rule, finding.service, finding.resource, finding.policy)


def _finding_counts(findings):
    """Counter of ``(identity, message)`` over the error-severity findings.

    Keeping the message *as well* costs nothing and buys better reporting: when
    a file has two findings of one rule, the exact-message match decides which
    of them is shown as the new one. It never changes the verdict — that is
    settled by the count per identity (see ``_split_new_and_inherited``).
    """
    return Counter((_finding_key(f), f.message)
                   for f in findings if f.severity == "error")


def _base_commit(base=None):
    """The commit whose tree is "the code before this change".

    With ``--base <ref>`` (CI) that is the merge-base, the same reference point
    ``changed_files`` uses, so merging the base branch in to catch up never
    counts as the contributor's edit. Without it (pre-commit) it is ``HEAD``:
    only what you are about to commit is yours.

    Raises ``BaseTreeUnavailable`` rather than guessing — see that class.
    """
    ref = base or "HEAD"
    fetch_hint = (f"check out with `fetch-depth: 0` (or `git fetch origin "
                  f"{ref.removeprefix('origin/')}`) so the gate can tell a finding "
                  "you introduced from one you inherited")
    rev = subprocess.run(["git", "rev-parse", "--verify", "--quiet", f"{ref}^{{commit}}"],
                         capture_output=True, text=True)
    commit = rev.stdout.strip()
    if rev.returncode != 0 or not commit:
        raise BaseTreeUnavailable(f"{ref!r} is not in this clone — {fetch_hint}.")

    if base:
        merge_base = subprocess.run(["git", "merge-base", "HEAD", base],
                                    capture_output=True, text=True)
        commit = merge_base.stdout.strip()
        if merge_base.returncode != 0 or not commit:
            raise BaseTreeUnavailable(
                f"HEAD and {base!r} have no common ancestor in this clone, which "
                f"means the history is shallow — {fetch_hint}.")

    # A ref can resolve while its tree is absent: that is exactly what a shallow
    # clone looks like from here, and it must fail rather than lint an empty tree.
    if subprocess.run(["git", "cat-file", "-e", f"{commit}^{{tree}}"],
                      capture_output=True).returncode != 0:
        raise BaseTreeUnavailable(
            f"the tree of {commit[:12]} is missing from this clone (shallow "
            f"history) — {fetch_hint}.")
    return commit


@contextlib.contextmanager
def _base_tree(commit):
    """A throwaway detached checkout of ``commit``, removed on the way out.

    A ``git worktree`` and not a stash/checkout dance, because this runs inside
    a checkout somebody else is standing in — a contributor's working tree with
    uncommitted edits, or a CI job mid-run. A worktree touches neither.
    """
    parent = tempfile.mkdtemp(prefix="policy-lint-base-")
    path = os.path.join(parent, "tree")
    add = subprocess.run(["git", "worktree", "add", "--detach", "--quiet", path, commit],
                         capture_output=True, text=True)
    if add.returncode != 0:
        shutil.rmtree(parent, ignore_errors=True)
        raise BaseTreeUnavailable(
            f"could not check out the base tree at {commit[:12]}: "
            f"{(add.stderr or add.stdout).strip()}")
    try:
        yield Path(path)
    finally:
        subprocess.run(["git", "worktree", "remove", "--force", path],
                       capture_output=True, text=True)
        shutil.rmtree(parent, ignore_errors=True)
        subprocess.run(["git", "worktree", "prune"], capture_output=True, text=True)


def _baseline_counts(triples, base_root):
    """What ``triples`` already produced on the base tree, as ``_finding_counts``.

    No ownership filter here: a finding that predates the branch is inherited
    whether or not it happens to sit in a file this change touched.
    """
    findings = []
    for platform, service, resource_type in sorted(triples):
        findings += policy_lint.lint_resource(base_root, platform, service, resource_type)
    return _finding_counts(findings)


def _split_new_and_inherited(owned, baseline):
    """Split HEAD's owned ``(path, Finding)`` pairs into ``(new, inherited)``.

    Per identity, ``max(0, head_count - base_count)`` findings are new — so one
    ``hard-coded-value`` in a file becoming two still fails, and two becoming
    one passes.
    """
    exact = Counter(baseline)
    by_identity = Counter()
    for (key, _message), count in baseline.items():
        by_identity[key] += count

    new, inherited, pending = [], [], []
    # Pass 1: identity AND message match — unambiguously the same finding.
    for path, finding in owned:
        key = _finding_key(finding)
        if exact[(key, finding.message)] > 0:
            exact[(key, finding.message)] -= 1
            by_identity[key] -= 1
            inherited.append((path, finding))
        else:
            pending.append((path, finding))
    # Pass 2: identity only — the message moved (a line number, a count), which
    # must never read as a new problem. What is left over is genuinely new.
    for path, finding in pending:
        key = _finding_key(finding)
        if by_identity[key] > 0:
            by_identity[key] -= 1
            inherited.append((path, finding))
        else:
            new.append((path, finding))
    return new, inherited


def _subtract_baseline(owned, base=None):
    """``(new, inherited)`` for HEAD's owned findings, against the base tree.

    Cost control (the owner pays for Actions minutes): the base tree is built
    only when something is owned at HEAD, and only the resource types that
    produced one of those findings are linted there. A target that is clean at
    HEAD has nothing to subtract, so linting it on the base is pure waste.
    """
    if not owned:
        return [], []
    with _base_tree(_base_commit(base)) as base_root:
        baseline = _baseline_counts(_owned_triples({path for path, _ in owned}), base_root)
    return _split_new_and_inherited(owned, baseline)


def _print_inherited(inherited):
    """Report the pre-existing findings in the contributor's own files.

    Context, never a failure: they were there before this change, and clearing
    them is separate work. But saying nothing would hide that the file you just
    edited has known problems, which is the other half of being honest about
    who owns what.
    """
    if not inherited:
        return
    by_rule = Counter(finding.rule for _, finding in inherited)
    summary = ", ".join(f"{rule} x{count}" for rule, count in sorted(by_rule.items()))
    print(f"\n[NOTE] {len(inherited)} pre-existing policy_lint error(s) in the file(s) "
          f"you touched — not attributed to you: {summary}")
    listed = sorted(inherited, key=lambda pair: (pair[0], pair[1].rule))
    for path, finding in listed[:INHERITED_PREVIEW]:
        print(f"  - {finding.rule}: {path}")
    if len(listed) > INHERITED_PREVIEW:
        print(f"  - ... and {len(listed) - INHERITED_PREVIEW} more (see them all with "
              "`python3 scripts/linters/policy_lint.py <platform>/<service>/<resource_type>`)")


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

    if base:
        # Resolved up-front, before anything else, because an unreachable base
        # ref is silent in both directions: `changed_files` would fall back to a
        # diff against a ref git cannot resolve, come back empty, and the whole
        # gate would report "nothing to check" and pass. A CI job that cannot see
        # its base branch must say so, not quietly wave the PR through.
        try:
            _base_commit(base)
        except BaseTreeUnavailable as exc:
            print(f"[FAIL] cannot establish what this branch changed: {exc}")
            return 1

    changed = None
    if not lint_all:
        changed = {f for f in changed_files(base) if f.startswith(RELEVANT_PREFIXES)}
        if not changed:
            print("No docs/ policies/ changes — skipping linter.")
            return 0
        print("Linting your changed files under docs/ policies/:")
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
    policy_lint_new, policy_lint_inherited, policy_lint_backlog = [], [], 0
    if changed is not None:
        triples = _owned_triples(changed)
        if triples:
            try:
                policy_lint_owned, policy_lint_backlog = _policy_lint_findings(
                    triples, changed)
                # Only the findings this change *introduced* are the
                # contributor's; everything the base tree already produced is
                # inherited. No owned findings means no base tree is built.
                policy_lint_new, policy_lint_inherited = _subtract_baseline(
                    policy_lint_owned, base)
            except BaseTreeUnavailable as exc:
                print("\n[FAIL] policy_lint cannot tell the findings you introduced "
                      f"from the ones you inherited: {exc}")
                return 1
            except policy_lint.PolicyLintError as exc:
                print(f"\n[FAIL] policy_lint could not run: {exc}")
                return 1

    if policy_lint_new:
        print("\n[FAIL] policy_lint error(s) your change introduced:\n")
        for path, finding in policy_lint_new:
            print(f"  {finding.rule}: {path} — {finding.message}")
        _print_inherited(policy_lint_inherited)
        if policy_lint_backlog:
            print(f"\n({policy_lint_backlog} pre-existing policy_lint error(s) elsewhere "
                  "are not attributed to you.)")
        return 1

    _print_inherited(policy_lint_inherited)

    suffix = f" ({backlog} pre-existing backlog error(s) elsewhere ignored)" if backlog else ""
    if policy_lint_backlog:
        suffix += (f"; {policy_lint_backlog} pre-existing policy_lint backlog error(s) "
                   "elsewhere ignored")
    print(f"\n[OK] no lint errors attributed to you{suffix}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
