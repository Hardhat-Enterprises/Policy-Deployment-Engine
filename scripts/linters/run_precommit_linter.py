#!/usr/bin/env python3
"""Lint gate: run the linter but only fail on the author's *own* changes.

The linter (scripts/linters/linter.py) is whole-tree by design — it must build
the full docs index to reconcile inputs/ and policies/ against it, so it cannot
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
RELEVANT_PREFIXES = ("docs/", "inputs/", "policies/")


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


def _lineage(a, b):
    """True if paths a and b are on the same lineage (one is ancestor-or-equal)."""
    a, b = a.rstrip("/"), b.rstrip("/")
    return a == b or a.startswith(b + "/") or b.startswith(a + "/")


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
        base = argv[i + 1] if i + 1 < len(argv) else "origin/dev"

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
    errors = [ln for ln in result.stdout.splitlines() if ln.startswith("[ERROR]")]
    if lint_all:
        mine, backlog = errors, 0
    else:
        owned = _owned(changed)
        mine = [ln for ln in errors if any(_lineage(_error_path(ln), o) for o in owned)]
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
