#!/usr/bin/env python3
"""Pre-commit gate: run the linter but only fail on the author's *own* changes.

The linter (scripts/linters/linter.py) is whole-tree by design — it must build
the full docs index to reconcile inputs/ and policies/ against it, so it can't
meaningfully lint a single file in isolation. To keep contributors honest about
their own work *without* blocking them on the repo-wide backlog, we:

  1. compute the set of changed files relative to ``dev`` (branch divergence +
     staged + unstaged), restricted to docs/ inputs/ policies/;
  2. run the linter once over the whole tree (with --content-checks);
  3. fail only on error lines whose path lineage intersects a changed file.

Pre-existing errors elsewhere (the fixture backlog, etc.) are reported as a
count but never block the commit. Run from the repo root.
"""
import os
import subprocess
import sys

LINTER = [sys.executable, os.path.join("scripts", "linters", "linter.py"),
          "--tree", "all", "--platform", "gcp", "--content-checks"]
RELEVANT_PREFIXES = ("docs/", "inputs/", "policies/")
DEV_REFS = ("dev", "origin/dev")


def _git(*args):
    out = subprocess.run(["git", *args], capture_output=True, text=True)
    return [ln for ln in out.stdout.splitlines() if ln]


def _dev_merge_base():
    """Merge-base with dev so we diff only the branch's own divergence."""
    for ref in DEV_REFS:
        r = subprocess.run(["git", "merge-base", "HEAD", ref],
                           capture_output=True, text=True)
        if r.returncode == 0 and r.stdout.strip():
            return r.stdout.strip()
    return None


def changed_files():
    """Files this branch changed vs dev, plus staged + unstaged worktree edits."""
    files = set(_git("diff", "--cached", "--name-only"))   # staged (this commit)
    files |= set(_git("diff", "--name-only"))              # unstaged worktree
    base = _dev_merge_base()
    if base:
        files |= set(_git("diff", "--name-only", base))    # branch divergence vs dev
    return {f.replace("\\", "/") for f in files}


def _lineage(a, b):
    """True if path a and b are on the same lineage (one is ancestor-or-equal)."""
    a, b = a.rstrip("/"), b.rstrip("/")
    return a == b or a.startswith(b + "/") or b.startswith(a + "/")


def _error_path(line):
    """Extract the file/dir path from a '[ERROR] [content] <path>: msg' line."""
    s = line[len("[ERROR]"):].strip()
    if s.startswith("[content]"):
        s = s[len("[content]"):].strip()
    return s.split(":", 1)[0].strip()


def main():
    changed = {f for f in changed_files() if f.startswith(RELEVANT_PREFIXES)}
    if not changed:
        print("No docs/ inputs/ policies/ changes — skipping linter.")
        return 0

    print("Changed files under docs/ inputs/ policies/:")
    for f in sorted(changed):
        print(f"  {f}")

    result = subprocess.run(LINTER, capture_output=True, text=True)
    errors = [ln for ln in result.stdout.splitlines() if ln.startswith("[ERROR]")]
    mine = [ln for ln in errors if any(_lineage(_error_path(ln), c) for c in changed)]
    backlog = len(errors) - len(mine)

    if mine:
        print("\n[FAIL] lint errors in files you changed:\n")
        for ln in mine:
            print(f"  {ln}")
        print(f"\nFix the above before committing. "
              f"({backlog} pre-existing error(s) elsewhere are not attributed to you.)")
        return 1

    print(f"\n[OK] no lint errors in your changed files "
          f"({backlog} pre-existing backlog error(s) elsewhere ignored).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
