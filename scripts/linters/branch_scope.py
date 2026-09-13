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

Anything else is somebody else's work or is shared by everybody, and a branch
that changes it is either a stray `git add .` or a merge gone wrong. Two of
those mistakes are silent and expensive:

* **The shared harness.** ``scripts/**`` and ``policies/_helpers/**`` are pulled
  from ``dev`` when the portal scans a branch, so editing them changes nothing
  about what the branch is actually checked against — it only makes the local
  run disagree with CI, and it makes the portal's drift check refuse to scan.
* **Somebody else's resource.** A stray ``git add .`` after a wide local test run
  sweeps up files from resources the branch has nothing to do with, and nothing
  about the contributor's own resource looks wrong afterwards.

Neither shows up as a failing test on the branch that caused it, which is why
this runs as its own gate on the push that introduces it.

Committed terraform plans (``<sha>.json``) live inside the fixture directory they
belong to, so they are covered by the ``inputs/`` line above and need no rule of
their own — with one exception: deleting one is allowed *inside the branch's own
scope*, because editing a fixture changes its sha and the harness prunes the plan
of the old version as it writes the new one. ``inputs/plan_cache/`` is the tree
those plans used to live in; a branch that re-adds it is working from a checkout
older than that move.

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
import re
import shlex
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
        "not even inside your own folder; rename by adding the new file. The one "
        "exception is a <sha>.json plan inside your own fixtures, which the harness "
        "prunes for you when a fixture changes."),
    "shared-harness-edit": (
        "The file is part of the shared test harness, helper library or templates. "
        "It is common to every resource type and is not editable from a resource branch."),
    "legacy-plan-cache": (
        "inputs/plan_cache/ no longer exists. Committed terraform plans now live as "
        "<sha>.json inside the fixture directory they were planned from."),
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

# Where committed plans used to live, before they moved beside their fixtures.
LEGACY_PLAN_CACHE_PREFIX = "inputs/plan_cache/"

# A committed plan is named for the sha of the *.tf beside it (auto_test.fixture_sha).
PLAN_FILE_RE = re.compile(r"^[0-9a-f]{64}\.json$")

# How wide a directory the recovery recipe is allowed to name.
#
# `git checkout origin/dev -- .` would also overwrite a resource type the
# contributor legitimately edited, if that type already exists on `dev` (a merged
# extra, a resubmission). Under the three content roots the recipe therefore
# names the resource type itself — `inputs/gcp/Cloud Storage/google_storage_bucket`
# — so a sibling resource is restored precisely and the contributor's own kit is
# never inside the command. Everywhere else the top-level directory is safe:
# nothing under `.github/`, `Guide/`, `scripts/` or `tests/` is ever one
# contributor's work.
CONTENT_ROOTS = ("docs/", "inputs/", "policies/")
RESOURCE_DEPTH = 4

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
    "legacy-plan-cache": (
        "Delete it with `git rm -r --cached inputs/plan_cache` (or `git checkout "
        "origin/{base} -- .` if the whole tree came back), then merge `origin/{base}` "
        "so your branch has the current layout. Your own plan is written beside your "
        "fixtures by the next `auto_test.py` run — commit that instead."),
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


def _git_text(*args):
    """stdout of a git command as text, or None if it failed.

    Used for the advisory context lines only: a missing upstream or a base ref
    that cannot be described must never turn a scope report into an error.
    """
    proc = subprocess.run(["git", *args], capture_output=True, text=True)
    if proc.returncode != 0:
        return None
    out = proc.stdout.strip()
    return out or None


def base_description(base):
    """``(sha7, committer date)`` for ``base``, or None if it cannot be read.

    Printed so a contributor can tell *which* `dev` they were compared against.
    A branch that merged `dev` a month ago and never merged again is measured
    against that month-old merge-base, and nothing else on screen says so.
    """
    described = _git_text("log", "-1", "--abbrev=7",
                          "--format=%h\t%cd", "--date=format:%Y-%m-%d %H:%M", base)
    if not described or "\t" not in described:
        return None
    sha, _, when = described.partition("\t")
    return sha, when


def upstream_gap():
    """``(upstream_name, behind, ahead)`` for HEAD against its upstream, else None.

    ``behind``/``ahead`` are counted from the local branch's point of view, so
    ``ahead`` is the number of commits that exist locally and not on GitHub —
    the ones an unpushed `git merge origin/dev` leaves behind, which is exactly
    the case that makes a contributor believe their branch is current when the
    portal can still only see the old one.
    """
    name = _git_text("rev-parse", "--abbrev-ref", "@{u}")
    if not name:
        return None
    counts = _git_text("rev-list", "--left-right", "--count", "@{u}...HEAD")
    if not counts:
        return None
    parts = counts.split()
    if len(parts) != 2 or not all(p.isdigit() for p in parts):
        return None
    return name, int(parts[0]), int(parts[1])


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
    that tells them what to do: a branch working from the pre-move layout is told
    that once, not once per resurrected cache file.
    """
    if path.startswith(LEGACY_PLAN_CACHE_PREFIX):
        # Deleting the old tree is exactly right; bringing it back is the mistake.
        return None if status == "D" else "legacy-plan-cache"
    if status == "D":
        # A fixture's *.tf edit changes its sha, and the harness prunes the plan of
        # the previous version as it writes the new one. That deletion is the
        # contributor doing the right thing — but only inside their own fixtures.
        if (PLAN_FILE_RE.match(path.rsplit("/", 1)[-1])
                and path_in_scope(path, platform, folder, resource_type)):
            return None
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
# The recovery recipe
# --------------------------------------------------------------------------- #
# Every per-rule remedy names one file, because a rule is about one file. On the
# branch this was written for that read as "run this 2,737 times": the report
# listed 2,737 findings and the three commands on screen each fixed one of them.
# The recipe below is built from the *whole* finding list rather than the
# truncated display list, so what is printed is the command that finishes the
# job, whatever its size.

# Characters that stop a double-quoted shell word being literal.
_UNSAFE_IN_DQUOTES = set('"$`\\!')


def _quote(path):
    """``path`` as one shell word: bare when it can be, double-quoted otherwise.

    Every service folder in this repo has a space in it and several have
    parentheses, so most resource paths need quoting; nothing in the tree needs
    more than double quotes, and a path that somehow does falls back to the
    single-quoted form.
    """
    if all(c.isalnum() or c in "._-/" for c in path):
        return path
    if any(c in _UNSAFE_IN_DQUOTES for c in path):
        return shlex.quote(path)
    return f'"{path}"'


def recovery_group(path):
    """The directory the recipe names on ``path``'s behalf.

    Under the three content roots that is the resource type itself
    (``inputs/<platform>/<Service folder>/<resource_type>``), so a sibling's kit
    is named exactly and the contributor's own is never inside the command; the
    top-level directory everywhere else; and the legacy plan cache as a whole,
    because a branch that resurrected it did so wholesale.
    """
    if path.startswith(LEGACY_PLAN_CACHE_PREFIX):
        return LEGACY_PLAN_CACHE_PREFIX.rstrip("/")
    parts = path.split("/")
    if path.startswith(CONTENT_ROOTS):
        return "/".join(parts[:RESOURCE_DEPTH])
    return parts[0]


def _ordered(paths):
    """Shared roots first, then resource paths; alphabetical within each depth."""
    return sorted(paths, key=lambda p: (p.count("/"), p))


def recovery_plan(findings):
    """``(restore, remove)`` — the paths for one ``git checkout`` and one ``git rm``.

    A finding is a removal when the file is not on the base at all (an addition,
    or the resurrected plan cache); everything else is a restore, including the
    shared-harness edits, which is what restoring them is.

    A directory that has to be restored is never *also* named for removal — the
    checkout would put the files back and the removal would then take the whole
    directory away. When both apply to the same group the additions are listed
    file by file instead.
    """
    restore, added = set(), []
    for finding in findings:
        if finding.rule == "legacy-plan-cache" or (
                finding.rule == "out-of-scope-file" and finding.status == "A"):
            added.append(finding.path)
        else:
            restore.add(recovery_group(finding.path))

    remove = set()
    for path in added:
        group = recovery_group(path)
        remove.add(path if group in restore else group)

    return _ordered(restore), _ordered(remove)


def recovery_lines(findings, base):
    """The ``How to fix all of the above`` block, as a list of lines."""
    restore, remove = recovery_plan(findings)
    if not restore and not remove:
        return []

    lines = ["", "How to fix all of the above",
             "  (one command each — not one per file listed above)"]
    step = 0
    if restore:
        step += 1
        lines.append(f"  {step}. Put the files back the way {base} has them:")
        lines.append(f"       git checkout {base} -- "
                     + " ".join(_quote(p) for p in restore))
    if remove:
        step += 1
        lines.append(f"  {step}. Drop the files {base} does not have "
                     f"(they came from your branch):")
        lines.append(f"       git rm -r -- " + " ".join(_quote(p) for p in remove))
    step += 1
    lines.append(f"  {step}. Check what is left, then commit and push:")
    lines.append("       git status")
    lines.append('       git commit -m "Restore shared files from dev"')
    lines.append("       git push")
    return lines


def context_lines(base, staged=False):
    """What the findings were measured against, and whether GitHub has seen it.

    The second half exists because "Already up to date" from ``git merge`` is
    true of the local branch and says nothing about the one the portal reads: a
    merge that was never pushed leaves the branch on GitHub as many commits
    behind as it was before.
    """
    lines = []
    if staged:
        lines.append("Compared your staged + unstaged changes against "
                     f"the scope of this branch (base for the commands below: {base}).")
    else:
        described = base_description(base)
        if described:
            lines.append(f"Compared against {base} @ {described[0]} ({described[1]})")
        else:
            lines.append(f"Compared against {base}")

    gap = upstream_gap()
    if gap:
        name, behind, ahead = gap
        lines.append(f"Your branch is {ahead} commit(s) ahead of and "
                     f"{behind} commit(s) behind {name}.")
        if ahead:
            lines.append(f"Your branch on GitHub is {ahead} commit(s) behind your "
                         f"local branch — run git push.")
    return lines


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #
def _print_rules():
    width = max(len(r) for r in RULES)
    for rule_id, description in RULES.items():
        print(f"{rule_id.ljust(width)}  {description}")


def _report(findings, max_per_rule, base="origin/dev", staged=False):
    """Human-readable report. Findings are grouped by rule so the explanation is
    printed once and a wiped plan cache does not scroll the real message away.

    The per-rule sections say *why* each file is a problem, one file's remedy as
    the example; the block after them says how to fix all of them at once.
    """
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
    for line in context_lines(base, staged):
        print(line)

    for line in recovery_lines(findings, base):
        print(line)

    print("\nYour branch may only change the files for its own resource type. "
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
        _report(findings, args.max_per_rule, base=args.base, staged=args.staged)
    else:
        print(f"[OK] {branch} changes only its own resource "
              f"({platform}/{folder}/{resource_type}); "
              f"{len(entries)} changed file(s) checked "
              f"({'staged + unstaged' if args.staged else 'against ' + args.base}).")

    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
