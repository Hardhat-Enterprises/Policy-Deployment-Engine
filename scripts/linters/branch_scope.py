#!/usr/bin/env python3
"""
branch_scope — a ``Service/`` branch may only change its own resource kit.

Every contributor works on one resource type, on a branch named
``Service/<platform>/<service_slug>/<resource_type>``. That branch name names
exactly one resource, so it also names exactly the set of files the branch is
allowed to touch::

    docs/<platform>/<Service folder>/<resource_type>.json      the documentation
    inputs/<platform>/<Service folder>/<resource_type>/**      the fixtures
    policies/<platform>/<Service folder>/<resource_type>/**    the policies
    inputs/plan_cache/**                                       additions only

Anything else is somebody else's work or is shared by everybody, and a branch
that changes it is either a stray `git add .` or a merge gone wrong. Two of
those mistakes are silent and expensive:

* **The shared harness.** ``scripts/**`` and ``policies/_helpers/**`` are pulled
  from ``dev`` when the portal scans a branch, so editing them changes nothing
  about what the branch is actually checked against — it only makes the local
  run disagree with CI, and it makes the portal's drift check refuse to scan.
* **The plan cache.** ``inputs/plan_cache/`` holds the committed terraform plan
  for *every* fixture in the repo. Running the test harness in a way that clears
  it deletes a thousand other people's cached plans, and nothing about the
  contributor's own resource looks wrong afterwards.

Neither shows up as a failing test on the branch that caused it, which is why
this runs as its own gate on the push that introduces it.

Note the service *slug* in the branch name is not the directory name: docs
folders contain spaces and parentheses that are illegal in a git ref, so
``docs/gcp/Cloud Run (v2 API)/`` is reached by the branch slug ``cloud_run_v2_api``.
The mapping is shared with ``check_branch_name.py`` (see ``_service_slug.py``).

Usage
-----
    python3 scripts/linters/branch_scope.py
    python3 scripts/linters/branch_scope.py --base origin/dev
    python3 scripts/linters/branch_scope.py --branch Service/gcp/dataplex/google_dataplex_task
    python3 scripts/linters/branch_scope.py --staged     # what you are about to commit
    python3 scripts/linters/branch_scope.py --json
    python3 scripts/linters/branch_scope.py --list-rules

Exit codes: 0 clean (or nothing to check — the branch is not a ``Service/``
branch), 1 at least one violation, 2 a usage or environment error (not a git
checkout, an unresolvable base ref, or a branch whose service slug does not name
a real docs folder — that last one is a branch-name problem, and
``check_branch_name.py`` explains it).
"""

import argparse
import json
import os
import subprocess
import sys
from dataclasses import dataclass, asdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _service_slug import slug_to_folder  # noqa: E402

RULES = {
    "out-of-scope-file": (
        "The file is not part of this branch's resource type. A Service/ branch may "
        "change only its own docs JSON, inputs/ fixtures and policies/ files."),
    "deleted-file": (
        "The branch deletes a file. Nothing on a resource branch needs a deletion — "
        "not even inside your own folder; rename by adding the new file."),
    "shared-harness-edit": (
        "The file is part of the shared test harness, helper library or templates. "
        "It is common to every resource type and is not editable from a resource branch."),
    "plan-cache-modified": (
        "inputs/plan_cache/ is append-only: it holds the committed terraform plan for "
        "every fixture in the repo, so a branch may add cache entries but never change "
        "or delete existing ones."),
}

# Shared across every resource type, so never in one branch's scope.
#
# `scripts/` and `policies/_helpers/` are the two the portal pulls from `dev`
# rather than from the branch (see Guide/Policy_writing_tutorial/policy-lint.md);
# `tests/` and `templates/` are shared source that a resource branch has no
# reason to touch. Everything else out of scope is reported as out-of-scope-file.
SHARED_HARNESS_PREFIXES = (
    "scripts/",
    "policies/_helpers/",
    "tests/",
    "templates/",
)

PLAN_CACHE_PREFIX = "inputs/plan_cache/"

SERVICE_PREFIX = "Service/"

# Where to send a contributor for each rule.
REMEDIES = {
    "out-of-scope-file": (
        "Restore it with `git checkout origin/{base} -- '{path}'`, then commit again. "
        "If it is a file you created by accident (an editor scratch file, a downloaded "
        "binary, a screenshot), delete it from the branch instead. Only touch "
        "{scope_hint}."),
    "deleted-file": (
        "Restore it with `git checkout origin/{base} -- '{path}'`. If you meant to "
        "rename something you added earlier on this branch, add the new name and leave "
        "the old file's deletion out of the PR — ask a senior team member if a real "
        "deletion is genuinely needed."),
    "shared-harness-edit": (
        "Restore it with `git checkout origin/{base} -- '{path}'`. If the harness or a "
        "template really does need changing, raise it with a senior team member so it "
        "can go in on its own feature/ branch — editing it here does not change what "
        "you are checked against, and it stops the portal scanning your branch."),
    "plan-cache-modified": (
        "Restore the cache with `git checkout origin/{base} -- inputs/plan_cache` and "
        "commit that. This usually means a local test run cleared the cache; re-run "
        "your tests afterwards and commit only the new entries it adds for your own "
        "fixtures."),
}


@dataclass(frozen=True)
class Finding:
    path: str
    status: str          # git diff status letter: A, M, D, R, T
    rule: str
    message: str
    severity: str = "error"


class ScopeError(Exception):
    """A usage or environment error — exit 2, not a finding about the branch."""


# --------------------------------------------------------------------------- #
# git plumbing
# --------------------------------------------------------------------------- #
def _git(*args):
    """Run a git command, returning stdout as bytes. Raises ScopeError on failure."""
    proc = subprocess.run(["git", *args], capture_output=True)
    if proc.returncode != 0:
        detail = (proc.stderr or b"").decode("utf-8", "replace").strip().splitlines()
        raise ScopeError(f"`git {' '.join(args)}` failed: "
                         f"{detail[0] if detail else 'no output'}")
    return proc.stdout


def current_branch():
    """The current branch name, or None (not a repo / detached HEAD, as in CI —
    pass --branch explicitly there)."""
    proc = subprocess.run(["git", "rev-parse", "--abbrev-ref", "HEAD"],
                          capture_output=True, text=True)
    if proc.returncode != 0:
        return None
    branch = proc.stdout.strip()
    return None if not branch or branch == "HEAD" else branch


def _parse_name_status(raw):
    """``[(status, path), ...]`` from ``git diff -z --name-status`` output.

    A rename arrives as one record with two paths; it is reported as a deletion
    of the old path plus an addition of the new one, which is what it is.
    """
    fields = [f.decode("utf-8", "surrogateescape") for f in raw.split(b"\0") if f != b""]
    entries, i = [], 0
    while i < len(fields):
        status = fields[i]
        letter = status[0]
        if letter in ("R", "C"):          # R<score>\0<old>\0<new>
            if i + 2 >= len(fields):
                break
            entries.append(("D", fields[i + 1]))
            entries.append(("A", fields[i + 2]))
            i += 3
        else:                             # <status>\0<path>
            if i + 1 >= len(fields):
                break
            entries.append((letter, fields[i + 1]))
            i += 2
    return entries


def staged_entries():
    """What this commit is about to contain: staged + unstaged changes.

    The pre-commit hook runs *before* the commit exists, so a base-ref diff would
    not yet see what is being committed. This mirrors ``run_precommit_linter.py``'s
    changed-set for the same reason — it is how a stray ``git add .`` is caught
    before it ever becomes a push.
    """
    seen, entries = set(), []
    for args in (("diff", "-z", "--name-status", "--cached"),
                 ("diff", "-z", "--name-status")):
        for status, path in _parse_name_status(_git(*args)):
            if path not in seen:
                seen.add(path)
                entries.append((status, path))
    return entries


def changed_entries(base, head="HEAD"):
    """``[(status, path), ...]`` for what *this branch* changed against ``base``.

    Uses the merge-base (the three-dot ``base...head`` diff) so that merging
    ``dev`` into the branch never registers as the contributor's own edits — a
    branch that is simply behind and merged up must not start failing.

    ``-z`` is used rather than plain ``--name-status``: it turns off git's
    C-style path quoting, and every service folder in this repo has a space in
    it (``inputs/gcp/Cloud Storage/...``).
    """
    merge_base = subprocess.run(["git", "merge-base", head, base],
                                capture_output=True, text=True)
    if merge_base.returncode == 0 and merge_base.stdout.strip():
        ref = merge_base.stdout.strip()
    else:
        # Shallow clone or an unrelated history: fall back to the ref itself so
        # the check still runs (it can only over-report, never under-report).
        ref = base

    return _parse_name_status(_git("diff", "-z", "--name-status", ref, head))


# --------------------------------------------------------------------------- #
# Scope
# --------------------------------------------------------------------------- #
def parse_branch(branch):
    """``(platform, slug, resource_type)`` for a Service/ branch, else None."""
    if not branch or not branch.startswith(SERVICE_PREFIX):
        return None
    parts = branch.split("/")
    if len(parts) != 4 or not all(parts):
        return None
    return parts[1], parts[2], parts[3]


def _segments_match(actual, expected):
    """Case-insensitive segment comparison.

    The branch slug is lower-case while the folder on disk is capitalised, and a
    contributor who miscapitalises a directory should get the structural
    linter's precise "does not match any docs/gcp service" error, not a
    misleading out-of-scope one from here.
    """
    return actual.casefold() == expected.casefold()


def resolve_scope(platform, slug, docs_root="docs"):
    """The docs folder name this branch owns.

    Raises ScopeError when the slug does not name a real ``docs/<platform>/``
    folder — that is a branch-name error, which ``check_branch_name.py`` reports
    properly, so this exits 2 rather than blaming the contributor's files.
    """
    folder = slug_to_folder(docs_root, platform).get(slug)
    if folder is None:
        raise ScopeError(
            f"service slug '{slug}' does not name any docs/{platform} service folder, "
            f"so the branch's scope cannot be determined. Run "
            f"`python3 scripts/linters/check_branch_name.py` for the naming rules.")
    return folder


def path_in_scope(path, platform, folder, resource_type):
    """Is ``path`` part of this branch's own resource kit?"""
    parts = path.split("/")
    if len(parts) < 4:
        return False
    tree, got_platform, got_folder = parts[0], parts[1], parts[2]
    if tree not in ("docs", "inputs", "policies"):
        return False
    if not _segments_match(got_platform, platform):
        return False
    if not _segments_match(got_folder, folder):
        return False

    if tree == "docs":
        # docs/<platform>/<folder>/<resource_type>.json — exactly one file.
        return len(parts) == 4 and _segments_match(parts[3], f"{resource_type}.json")

    # inputs|policies/<platform>/<folder>/<resource_type>/** — anything below.
    return len(parts) >= 5 and _segments_match(parts[3], resource_type)


def classify(status, path, platform, folder, resource_type):
    """The single rule ``path`` breaks, or None if it is allowed.

    Order is most-specific-location first so a contributor gets the one message
    that tells them what to do: a wiped plan cache is a plan-cache problem, not a
    thousand separate deletions.
    """
    if path.startswith(PLAN_CACHE_PREFIX):
        return None if status == "A" else "plan-cache-modified"
    if status == "D":
        return "deleted-file"
    if path.startswith(SHARED_HARNESS_PREFIXES):
        return "shared-harness-edit"
    if path_in_scope(path, platform, folder, resource_type):
        return None
    return "out-of-scope-file"


def check(entries, platform, folder, resource_type, base="dev"):
    """``[Finding, ...]`` for a branch's changed entries, sorted by rule then path."""
    scope_hint = (f"docs/{platform}/{folder}/{resource_type}.json, "
                  f"inputs/{platform}/{folder}/{resource_type}/ and "
                  f"policies/{platform}/{folder}/{resource_type}/")
    findings = []
    for status, path in entries:
        rule = classify(status, path, platform, folder, resource_type)
        if rule is None:
            continue
        remedy = REMEDIES[rule].format(base=base, path=path, scope_hint=scope_hint)
        findings.append(Finding(path=path, status=status, rule=rule, message=remedy))
    findings.sort(key=lambda f: (f.rule, f.path))
    return findings


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #
def _print_rules():
    width = max(len(r) for r in RULES)
    for rule_id, description in RULES.items():
        print(f"{rule_id.ljust(width)}  {description}")


def _report(findings, max_per_rule):
    """Human-readable report. Findings are grouped by rule so the explanation is
    printed once and a wiped plan cache does not scroll the real message away."""
    by_rule = {}
    for finding in findings:
        by_rule.setdefault(finding.rule, []).append(finding)

    for rule_id, group in by_rule.items():
        print(f"\n[error] {rule_id} — {RULES[rule_id]}")
        shown = group if max_per_rule <= 0 else group[:max_per_rule]
        for finding in shown:
            print(f"  {rule_id} {finding.path}")
        hidden = len(group) - len(shown)
        if hidden:
            print(f"  ... and {hidden} more file(s) with the same problem")
        print(f"  -> {group[0].message}")

    total = len(findings)
    print(f"\n{total} violation(s) in {len(by_rule)} rule(s).")
    print("Your branch may only change the files for its own resource type. "
          "See Guide/Policy_writing_tutorial/branch-scope.md")


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Check that a Service/ branch changes only its own resource's files.",
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--base", default="origin/dev",
                        help="base ref to diff against (default: origin/dev). The "
                             "merge-base is used, so merging dev in is never counted "
                             "as your own change.")
    parser.add_argument("--branch", default=None,
                        help="branch whose name defines the scope (default: the current "
                             "git branch). CI checks out a detached HEAD, so pass it "
                             "explicitly there.")
    parser.add_argument("--head", default="HEAD",
                        help="ref holding the changes to check (default: HEAD). Pass a "
                             "remote ref to review someone else's branch without "
                             "checking it out.")
    parser.add_argument("--staged", action="store_true",
                        help="check what this commit is about to contain (staged + "
                             "unstaged changes) instead of the branch's diff against "
                             "--base. Used by the pre-commit hook, which runs before "
                             "the commit exists.")
    parser.add_argument("--docs", default="docs", help="docs root (default: docs).")
    parser.add_argument("--json", action="store_true", dest="as_json",
                        help="print the findings as a JSON array")
    parser.add_argument("--max-per-rule", type=int, default=10,
                        help="how many paths to list per rule before summarising "
                             "(default: 10; 0 for all)")
    parser.add_argument("--list-rules", action="store_true",
                        help="print every rule id and its description, then exit")
    args = parser.parse_args(argv)

    if args.list_rules:
        _print_rules()
        return 0

    branch = args.branch if args.branch is not None else current_branch()
    if branch is None:
        print("[ERROR] could not determine the current git branch (not a repo, or "
              "detached HEAD). Pass --branch <name> explicitly.", file=sys.stderr)
        return 2

    parsed = parse_branch(branch)
    if parsed is None:
        # feature/ branches and dev are out of this check's remit entirely.
        if not args.as_json:
            print(f"[*] '{branch}' is not a Service/<platform>/<service>/<resource> "
                  f"branch — nothing to scope-check.")
        else:
            print("[]")
        return 0

    platform, slug, resource_type = parsed
    try:
        folder = resolve_scope(platform, slug, args.docs)
        entries = (staged_entries() if args.staged
                   else changed_entries(args.base, args.head))
    except ScopeError as exc:
        print(f"[ERROR] branch_scope could not run: {exc}", file=sys.stderr)
        return 2

    base_label = args.base.split("/")[-1] if "/" in args.base else args.base
    findings = check(entries, platform, folder, resource_type, base=base_label)

    if args.as_json:
        print(json.dumps([asdict(f) for f in findings], indent=2))
    elif findings:
        print(f"[FAIL] {branch} changes files outside its own resource type.")
        print(f"       This branch owns: docs/{platform}/{folder}/{resource_type}.json, "
              f"inputs/{platform}/{folder}/{resource_type}/, "
              f"policies/{platform}/{folder}/{resource_type}/")
        _report(findings, args.max_per_rule)
    else:
        print(f"[OK] {branch} changes only its own resource "
              f"({platform}/{folder}/{resource_type}); "
              f"{len(entries)} changed file(s) checked "
              f"({'staged + unstaged' if args.staged else 'against ' + args.base}).")

    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
