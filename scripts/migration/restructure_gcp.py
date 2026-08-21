#!/usr/bin/env python3
"""One-shot cutover: collapse the mirrored inputs/ + policies/ trees into one.

BEFORE                                        AFTER
  policies/gcp/<S>/<R>/<arg>.rego               policies/gcp/config.tf
  policies/gcp/<S>/<R>/_vars.rego               policies/gcp/<S>/<R>/_vars.rego
  inputs/gcp/<S>/<R>/<arg>/compliant.tf         policies/gcp/<S>/<R>/<arg>/policy.rego
  inputs/gcp/<S>/<R>/<arg>/nonCompliant.tf      policies/gcp/<S>/<R>/<arg>/compliant.tf
  inputs/gcp/<S>/<R>/<arg>/config.tf  (x1000+)  policies/gcp/<S>/<R>/<arg>/nonCompliant.tf
  inputs/plan_cache/gcp/<sha>.json              plan_cache/gcp/<sha>.json

_vars.rego does NOT move: it already sits at the resource level, which is where the
target layout wants it.

This script ONLY moves and deletes files. It never edits file contents, never runs git,
terraform or opa, and never commits, merges or pushes. Review and commit are yours.

    python scripts/migration/restructure_gcp.py            # dry run (default), changes nothing
    python scripts/migration/restructure_gcp.py --apply    # perform the moves

Everything is discovered from the tree, so however many policies exist at cutover is
however many get migrated.
"""
import argparse
import hashlib
import shutil
import subprocess
import sys
from pathlib import Path

PLATFORM = "gcp"
VARS_FILE = "_vars.rego"
POLICY_FILE = "policy.rego"
CONFIG_FILE = "config.tf"
FIXTURE_FILES = ("compliant.tf", "nonCompliant.tf")
EXPECTED_FIXTURE_ENTRIES = set(FIXTURE_FILES) | {CONFIG_FILE}


class Abort(Exception):
    """A preflight check failed; nothing has been touched."""


def sha256_lf(path):
    """Hash with CRLF normalised, so a Windows checkout compares equal to Linux."""
    return hashlib.sha256(path.read_bytes().replace(b"\r\n", b"\n")).hexdigest()


# --------------------------------------------------------------------------- #
# Discovery
# --------------------------------------------------------------------------- #
def discover(repo):
    """Return (policies, cache_files) for the current tree.

    ``policies`` is one dict per argument policy. Nothing is read beyond directory
    listings (config.tf bytes are read later, by the preflight identity check).
    """
    policies_gcp = repo / "policies" / PLATFORM
    inputs_gcp = repo / "inputs" / PLATFORM

    policies = []
    for rego in sorted(policies_gcp.rglob("*.rego")):
        if rego.name == VARS_FILE:
            continue
        service, resource, argument = rego.parts[-3], rego.parts[-2], rego.stem
        policies.append({
            "rego": rego,
            "service": service,
            "resource": resource,
            "argument": argument,
            "fixture_dir": inputs_gcp / service / resource / argument,
            "target_dir": policies_gcp / service / resource / argument,
        })

    cache_dir = repo / "inputs" / "plan_cache" / PLATFORM
    cache_files = sorted(cache_dir.glob("*.json")) if cache_dir.is_dir() else []
    return policies, cache_files


# --------------------------------------------------------------------------- #
# Preflight: every check runs before any mutation; any failure aborts
# --------------------------------------------------------------------------- #
def preflight(repo, policies, allow_any_branch, allow_dirty):
    problems = []

    for required in ("policies/gcp", "inputs/gcp", "scripts/auto_test"):
        if not (repo / required).is_dir():
            problems.append(f"not a Policy-Deployment-Engine checkout: {required}/ is missing")
    if problems:
        raise Abort(problems)

    # A dirty tree makes the post-migration diff unreviewable.
    status = subprocess.run(["git", "status", "--porcelain"], cwd=repo,
                            capture_output=True, text=True)
    if status.returncode != 0:
        problems.append("could not run 'git status' -- is this a git repository?")
    elif status.stdout.strip() and not allow_dirty:
        n = len(status.stdout.strip().splitlines())
        problems.append(f"working tree has {n} uncommitted change(s); commit or stash first "
                        "(or pass --allow-dirty if you know what you are doing)")

    branch = subprocess.run(["git", "rev-parse", "--abbrev-ref", "HEAD"], cwd=repo,
                            capture_output=True, text=True).stdout.strip()
    if branch != "dev" and not allow_any_branch:
        problems.append(f"on branch '{branch}', expected 'dev' "
                        "(pass --allow-any-branch to override)")

    if not policies:
        problems.append("no argument policies found under policies/gcp -- nothing to migrate")

    # Every policy must have a complete fixture dir, and every fixture dir a policy.
    fixture_dirs_seen = set()
    for p in policies:
        fx = p["fixture_dir"]
        if not fx.is_dir():
            problems.append(f"policy has no fixture dir: {p['rego']} -> expected {fx}/")
            continue
        fixture_dirs_seen.add(fx.resolve())
        entries = {e.name for e in fx.iterdir()}
        missing = EXPECTED_FIXTURE_ENTRIES - entries
        extra = entries - EXPECTED_FIXTURE_ENTRIES
        if missing:
            problems.append(f"{fx}: missing {sorted(missing)}")
        if extra:
            problems.append(f"{fx}: unexpected entries {sorted(extra)} -- clean these up first")

    inputs_gcp = repo / "inputs" / PLATFORM
    for fx in sorted(d for d in inputs_gcp.rglob("*") if d.is_dir() and any(d.glob("*.tf"))):
        if fx.resolve() not in fixture_dirs_seen:
            rel = fx.relative_to(inputs_gcp)
            problems.append(f"fixture dir has no policy: {fx}/ -> expected "
                            f"policies/{PLATFORM}/{rel}.rego")

    # The canonical-config premise: every config.tf must be byte-identical.
    configs = sorted(inputs_gcp.rglob(CONFIG_FILE))
    if configs:
        digests = {}
        for c in configs:
            digests.setdefault(sha256_lf(c), []).append(c)
        if len(digests) > 1:
            problems.append(f"{CONFIG_FILE} files are NOT all identical "
                            f"({len(digests)} distinct contents) -- one canonical copy is unsafe:")
            for digest, paths in sorted(digests.items(), key=lambda kv: -len(kv[1])):
                problems.append(f"    {digest[:12]}  x{len(paths)}  e.g. {paths[0]}")

    # Nothing may already exist at a target path.
    for t in (repo / "policies" / PLATFORM / CONFIG_FILE, repo / "plan_cache"):
        if t.exists():
            problems.append(f"target already exists: {t} -- has this migration already run?")
    for p in policies:
        if p["target_dir"].exists():
            problems.append(f"target already exists: {p['target_dir']}/")

    if problems:
        raise Abort(problems)


# --------------------------------------------------------------------------- #
# The plan: an ordered list of (kind, src, dst) operations; dst None means delete
# --------------------------------------------------------------------------- #
def build_plan(repo, policies, cache_files):
    ops = []
    policies_gcp = repo / "policies" / PLATFORM

    # 1. Promote one config.tf to the platform root; the rest are deleted below.
    canonical = policies[0]["fixture_dir"] / CONFIG_FILE
    ops.append(("move-config", canonical, policies_gcp / CONFIG_FILE))

    # 2-4. Per policy: rego into its own dir, fixtures alongside it, duplicate config gone.
    for p in policies:
        ops.append(("move-policy", p["rego"], p["target_dir"] / POLICY_FILE))
        for name in FIXTURE_FILES:
            ops.append(("move-fixture", p["fixture_dir"] / name, p["target_dir"] / name))
        dup = p["fixture_dir"] / CONFIG_FILE
        if dup != canonical:
            ops.append(("delete-config", dup, None))

    # 5. Plan cache to the repo root.
    for f in cache_files:
        ops.append(("move-cache", f, repo / "plan_cache" / PLATFORM / f.name))

    # 6. Placeholder platforms under inputs/ are obsolete once inputs/ is gone.
    #    policies/aws and policies/azure keep theirs.
    for placeholder in sorted((repo / "inputs").glob("*/.gitkeep")):
        ops.append(("delete-placeholder", placeholder, None))

    return ops


def summarise(ops):
    counts = {}
    for kind, _, _ in ops:
        counts[kind] = counts.get(kind, 0) + 1
    return counts


# --------------------------------------------------------------------------- #
# Execution: moves and deletes only
# --------------------------------------------------------------------------- #
def execute(repo, ops):
    for _kind, src, dst in ops:
        if dst is None:
            src.unlink()
        else:
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(str(src), str(dst))

    # Remove directories the moves emptied, deepest first, up to and including inputs/.
    inputs_root = repo / "inputs"
    removed = 0
    if inputs_root.is_dir():
        for d in sorted((p for p in inputs_root.rglob("*") if p.is_dir()),
                        key=lambda p: len(p.parts), reverse=True):
            if not any(d.iterdir()):
                d.rmdir()
                removed += 1
        if not any(inputs_root.iterdir()):
            inputs_root.rmdir()
            removed += 1
        else:
            print("\n  NOTE: inputs/ is not empty, leaving it in place. Remaining:")
            for item in sorted(p.relative_to(repo) for p in inputs_root.rglob("*"))[:20]:
                print(f"    {item}")
    return removed


LABELS = {
    "move-config": "config.tf promoted to policies/gcp/",
    "move-policy": "<argument>.rego -> <argument>/policy.rego",
    "move-fixture": "fixture .tf -> policy directory",
    "move-cache": "plan cache -> plan_cache/gcp/",
    "delete-config": "duplicate config.tf deleted",
    "delete-placeholder": "obsolete inputs/ placeholder deleted",
}

def main(argv=None):
    ap = argparse.ArgumentParser(
        description="Collapse inputs/ + policies/ into one self-contained policies/ tree.")
    ap.add_argument("--apply", action="store_true",
                    help="Perform the moves. Without it this is a dry run that changes nothing.")
    ap.add_argument("--repo-root", default=None,
                    help="Repo to migrate (default: the repo this script lives in).")
    ap.add_argument("--allow-any-branch", action="store_true",
                    help="Skip the 'must be on dev' check.")
    ap.add_argument("--allow-dirty", action="store_true",
                    help="Skip the clean-working-tree check.")
    args = ap.parse_args(argv)

    repo = Path(args.repo_root).resolve() if args.repo_root else Path(__file__).resolve().parents[2]
    mode = "APPLY (files will be moved)" if args.apply else "DRY RUN (nothing will change)"
    print(f"Repository: {repo}")
    print(f"Mode:       {mode}\n")

    policies, cache_files = discover(repo)
    print(f"Discovered: {len(policies)} argument policies, {len(cache_files)} cached plans")

    try:
        preflight(repo, policies, args.allow_any_branch, args.allow_dirty)
    except Abort as exc:
        problems = exc.args[0]
        print(f"\n[ABORT] {len(problems)} preflight problem(s); nothing was touched:\n")
        for p in problems[:40]:
            print(f"  - {p}")
        if len(problems) > 40:
            print(f"  ... and {len(problems) - 40} more")
        return 1
    print("Preflight:  all checks passed\n")

    ops = build_plan(repo, policies, cache_files)
    counts = summarise(ops)

    print("Planned operations:")
    for kind in ("move-config", "move-policy", "move-fixture", "move-cache",
                 "delete-config", "delete-placeholder"):
        if kind in counts:
            print(f"  {counts[kind]:>6}  {LABELS[kind]}")
    print(f"  {'-' * 6}")
    print(f"  {len(ops):>6}  total\n")

    print("Sample (first 3 policies):")
    for _kind, src, dst in [o for o in ops if o[0] in ("move-policy", "move-fixture")][:9]:
        print(f"    {src.relative_to(repo)}")
        print(f"      -> {dst.relative_to(repo)}")

    if not args.apply:
        print("\nDry run complete -- nothing was changed.")
        print("Re-run with --apply to perform the migration.")
        return 0

    print("\nApplying...")
    removed = execute(repo, ops)
    print(f"Done. {len(ops)} operation(s) applied, {removed} empty director(ies) removed.\n")
    print("This script has NOT staged, committed or pushed anything. Next:")
    print("    git add -A")
    print("    git status --short | head")
    print("    python scripts/linters/linter.py --tree all --platform gcp")
    print("    python scripts/auto_test/auto_test.py gcp --verify-plan-cache")
    print("    python scripts/auto_test/auto_test.py gcp")
    return 0


if __name__ == "__main__":
    sys.exit(main())
