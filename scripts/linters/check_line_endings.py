#!/usr/bin/env python3
"""
Report tracked text files whose committed blob holds CRLF line endings.

Nothing in the harness depends on line endings any more — ``.gitattributes``
normalises on check-in, and ``auto_test.fixture_sha`` canonicalises before
hashing, so a CRLF file no longer changes a fixture's plan name. This is not a
correctness gate; it is a smoke alarm for one specific thing that can still
happen and is invisible until it hurts:

    `.gitattributes` normalises new *content* at check-in. It does not
    retro-fix blobs already committed on a branch cut before it landed, and git
    does not renormalise on merge. So such a branch can still carry CRLF blobs
    onto dev — which is exactly how google_compute_network_endpoints arrived
    after the fix that was supposed to prevent it.

The symptom is nasty out of proportion to the cause: the blob is CRLF while the
attribute says LF, so git reports the file as *modified in every clean
checkout*, forever, for everyone. During the September 2026 incident that made
run_precommit_linter attribute two unrelated errors to whoever happened to be
committing, on whatever branch.

Run it against a checkout (it reads the index, so it describes the commit you
have checked out, not your working tree edits):

    python3 scripts/linters/check_line_endings.py

Exits 1 when anything is found, so it works as a check. In CI it is deliberately
wired report-only (`continue-on-error`) on the dev-only whole-tree workflow: a
CRLF blob is worth knowing about the day it lands, and is never worth blocking
every contributor over. That distinction is the whole point — a hard whole-tree
gate on this would reproduce the incident it exists to catch.
"""
import argparse
import subprocess
import sys

# Trees worth watching. scripts/ and Guide/ are included because the same merge
# that carries a fixture can carry a helper or a doc.
DEFAULT_PATHS = ("docs", "inputs", "policies", "scripts", "templates", "tests", "Guide")

# `git ls-files --eol` index states that mean "this blob is not LF-clean".
# `i/none` (no line endings at all) and `i/-text` (binary) are both fine.
BAD_INDEX_EOL = ("crlf", "mixed")

REMEDY = """
Fix on the branch that introduced them:

    git config core.autocrlf input      # Windows only; stops it recurring
    git add --renormalize .
    git commit -m "Normalise line endings"

If a fixture's committed plan then reports as missing, run
`python3 scripts/auto_test/auto_test.py` and commit the renames it makes — the
plan contents are already correct, so no terraform is needed.
""".strip()


def parse_eol_line(line):
    """``('crlf', 'path')`` from one `git ls-files --eol` line, or None.

    The format is ``i/<eol>\tw/<eol>\tattr/<attrs>\t<path>``, except the first
    three fields are space-padded rather than tab-separated in practice, so the
    path is taken from the last tab and the states from the leading tokens.
    """
    if "\t" not in line:
        return None
    head, path = line.split("\t")[0], line.split("\t")[-1]
    fields = head.split()
    if not fields or not fields[0].startswith("i/"):
        return None
    return fields[0][len("i/"):], path


def crlf_files(paths=DEFAULT_PATHS, cwd=None):
    """Tracked files under ``paths`` whose index blob is CRLF or mixed."""
    proc = subprocess.run(["git", "ls-files", "--eol", "--", *paths],
                          capture_output=True, text=True, cwd=cwd)
    if proc.returncode != 0:
        raise RuntimeError(proc.stderr.strip() or "git ls-files --eol failed")
    found = []
    for line in proc.stdout.splitlines():
        parsed = parse_eol_line(line)
        if parsed and parsed[0] in BAD_INDEX_EOL:
            found.append(parsed[1])
    return sorted(found)


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Report tracked files committed with CRLF line endings.")
    parser.add_argument("paths", nargs="*", default=list(DEFAULT_PATHS),
                        help=f"paths to scan (default: {' '.join(DEFAULT_PATHS)})")
    parser.add_argument("--quiet", action="store_true",
                        help="print only the count and the paths, no remedy text")
    args = parser.parse_args(argv)

    try:
        found = crlf_files(args.paths or DEFAULT_PATHS)
    except RuntimeError as exc:
        print(f"[ERROR] {exc}", file=sys.stderr)
        return 2

    if not found:
        print("[OK] no tracked files carry CRLF line endings.")
        return 0

    print(f"[WARN] {len(found)} tracked file(s) committed with CRLF line endings.")
    print("       They will show as modified in every clean checkout until "
          "renormalised.\n")
    for path in found:
        print(f"  {path}")
    if not args.quiet:
        print(f"\n{REMEDY}")
    return 1


if __name__ == "__main__":
    sys.exit(main())
