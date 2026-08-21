#!/usr/bin/env python3
"""Lint gate: run the linter but only fail on the author's *own* changes.

The linter (scripts/linters/linter.py) is whole-tree by design — it must build
the full docs index to reconcile policies/ against it, so it cannot
meaningfully lint a single file in isolation. To hold contributors to their own
work *without* blocking them on the repo-wide backlog, we run the linter once
over the whole tree (with --content-checks) and fail only on error lines whose
path intersects the changed set. Pre-existing errors elsewhere are reported as a
count but never block.

Modes (run from the repo root):
  (no args)         pre-commit: changed set = staged + unstaged worktree edits
  --base <ref>      CI/PR:      changed set = everything this branch changed vs
                                the merge-base with <ref> (e.g. origin/dev)
  --all             maintainer: no filter — fail on ANY error in the tree
"""
import os
import subprocess
import sys

LINTER = [sys.executable, os.path.join("scripts", "linters", "linter.py"),
          "--tree", "all", "--platform", "gcp", "--content-checks"]
RELEVANT_PREFIXES = ("docs/", "policies/")
# The files that make up one argument policy; touching any of them means owning
# the whole argument directory (see _owned).
ARGUMENT_FILES = {"policy.rego", "compliant.tf", "nonCompliant.tf"}


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

    suffix = f" ({backlog} pre-existing backlog error(s) elsewhere ignored)" if backlog else ""
    print(f"\n[OK] no lint errors in scope{suffix}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
