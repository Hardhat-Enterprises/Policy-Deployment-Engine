"""Deferred GCP cutover. Dry-run by default; never invokes git writes, Terraform or OPA.

The input is current dev's flat policies and fixture-local <sha>.json plans.
The output co-locates policy.rego, both fixtures and their plan under policies/.
One shared config is selected by normalized frequency; differing configs remain
local overrides. Policy bodies, fixture bytes and effective hashes are preserved.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
from dataclasses import dataclass, field
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from scripts.auto_test.auto_test import (
    PLAN_FILE_RE, canonical_text_bytes, fixture_files, fixture_sha,
    plan_cache_path, sha_for_files,
)

FIXTURES = ("compliant.tf", "nonCompliant.tf")


class Abort(Exception):
    """The source or destination cannot be migrated without ambiguity."""


@dataclass
class Operation:
    kind: str
    source: Path
    destination: Path | None


@dataclass
class Migration:
    root: Path
    operations: list[Operation] = field(default_factory=list)
    # logical (service, resource, argument) -> effective hash before the move
    hashes: dict[tuple[str, str, str], str] = field(default_factory=dict)
    # Every affected source is checked again before the first write.
    fingerprints: dict[Path, str] = field(default_factory=dict)
    preserved: dict[Path, str] = field(default_factory=dict)
    already_migrated: bool = False


def fingerprint(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def contained(root: Path, path: Path) -> None:
    try:
        path.resolve().relative_to(root)
    except ValueError:
        raise Abort(f"Path escapes the selected repository: {path}") from None
    if path.is_symlink():
        raise Abort(f"Symlinks cannot be migrated safely: {path}")


def valid_plan(path: Path) -> None:
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        if not isinstance(data, dict) or not isinstance(data.get("planned_values"), dict):
            raise ValueError("missing planned_values object")
    except (OSError, ValueError) as exc:
        raise Abort(f"Invalid Terraform plan {path}: {exc}") from exc


def source_plan(directory: Path, files: dict[str, Path], sha: str) -> Path:
    """Accept only the current hash or a provably equivalent old text spelling."""
    alternatives = {sha_for_files(files, lambda b: b),
                    sha_for_files(files, lambda b: canonical_text_bytes(b).replace(b"\n", b"\r\n"))}
    candidates = sorted(directory.glob("*.json"))
    if len(candidates) != 1:
        raise Abort(f"{directory}: expected exactly one committed plan, found {len(candidates)}; "
                    "sync dev and refresh this fixture before migration")
    plan = candidates[0]
    if not PLAN_FILE_RE.fullmatch(plan.name) or plan.stem not in alternatives | {sha}:
        raise Abort(f"{plan}: missing or stale plan; expected {sha}.json. "
                    "Rebuild it with dev's harness before migration")
    valid_plan(plan)
    return plan


def _verify_migrated(root: Path, nested: list[Path]) -> Migration:
    shared = root / "policies/gcp/config.tf"
    if not shared.is_file():
        raise Abort(f"Partial migration: missing shared config {shared}")
    plan = Migration(root, already_migrated=True)
    seen = set()
    for policy in nested:
        rel = policy.relative_to(root / "policies/gcp")
        if len(rel.parts) != 4:
            raise Abort(f"Unexpected nested policy path: {policy}")
        directory = policy.parent
        required = {"policy.rego", *FIXTURES}
        files = {p.name for p in directory.iterdir() if p.is_file()}
        if not required <= files:
            raise Abort(f"Partial migration: incomplete argument directory {directory}")
        for child in directory.iterdir():
            contained(root, child)
            if not child.is_file() or (child.name not in required | {"config.tf"}
                                      and not PLAN_FILE_RE.fullmatch(child.name)):
                raise Abort(f"Unexpected entry in migrated argument: {child}")
        sha = fixture_sha(directory, root)
        expected = plan_cache_path(directory, root)
        plans = list(directory.glob("*.json"))
        if plans != [expected]:
            raise Abort(f"Partial migration: expected only {expected}")
        valid_plan(expected)
        identity = tuple(rel.parts[:3])
        if identity in plan.hashes:
            raise Abort(f"Duplicate policy identity: {identity}")
        plan.hashes[identity] = sha
        seen.add(directory.resolve())
    for tf in (root / "policies/gcp").rglob("*.tf"):
        if tf != shared and tf.parent.resolve() not in seen:
            raise Abort(f"Partial migration: fixture without a policy: {tf}")
    return plan


def prepare(root: Path) -> Migration:
    """Discover and fully validate the cutover, without modifying any file."""
    root = Path(root).resolve()
    policies_root = root / "policies/gcp"
    inputs_root = root / "inputs/gcp"
    if not policies_root.is_dir():
        raise Abort(f"Not a GCP policy checkout: {policies_root} is missing")
    regos = sorted(policies_root.rglob("*.rego"))
    flat = [p for p in regos if p.name not in {"_vars.rego", "policy.rego"}]
    nested = [p for p in regos if p.name == "policy.rego"]
    old_files = [p for p in inputs_root.rglob("*") if p.is_file() and p.name != ".gitkeep"]
    if nested:
        if flat or old_files:
            raise Abort("Partial/mixed migration: both old and new policy/fixture paths exist")
        return _verify_migrated(root, nested)
    if not flat:
        raise Abort("No policies found to migrate")
    shared = policies_root / "config.tf"
    if shared.exists():
        raise Abort(f"Partial migration: target already exists: {shared}")
    if (root / "plan_cache").exists() or (root / "inputs/plan_cache").exists():
        raise Abort("Legacy central plan cache remains; sync dev's fixture-local plans before cutover")

    result = Migration(root)
    records = []
    config_groups = defaultdict(list)
    accounted = set()
    for policy in flat:
        rel = policy.relative_to(policies_root)
        if len(rel.parts) != 3:
            raise Abort(f"Unexpected legacy policy path: {policy}")
        service, resource, filename = rel.parts
        argument = filename[:-len(".rego")]
        identity = (service, resource, argument)
        source = inputs_root / service / resource / argument
        target = policies_root / service / resource / argument
        if target.exists():
            raise Abort(f"Target already exists: {target}")
        if not source.is_dir():
            raise Abort(f"Policy has no fixture directory: {policy}")
        required = {*FIXTURES, "config.tf"}
        for name in required:
            if not (source / name).is_file():
                raise Abort(f"Missing fixture source: {source / name}")
        for entry in source.iterdir():
            if not entry.is_file() or (entry.name not in required and not entry.name.endswith(".json")):
                raise Abort(f"Unexpected fixture entry: {entry}; clean it up before cutover")
        files = {name: source / name for name in required}
        sha = sha_for_files(files)
        committed = source_plan(source, files, sha)
        config_groups[canonical_text_bytes(files["config.tf"].read_bytes())].append(files["config.tf"])
        records.append((identity, policy, source, target, committed, sha))
        result.hashes[identity] = sha
        accounted.update(p.resolve() for p in source.iterdir())
    leftovers = [p for p in old_files if p.resolve() not in accounted]
    if leftovers:
        raise Abort(f"Orphan inputs or unrecognized files: {leftovers[0]} ({len(leftovers)} total)")

    # Stable tie-break: lexical repository-relative source path, independent of discovery order.
    canonical_group = min(config_groups.values(), key=lambda group: (
        -len(group), min(p.relative_to(root).as_posix() for p in group)))
    canonical = min(canonical_group, key=lambda p: p.relative_to(root).as_posix())
    canonical_bytes = canonical_text_bytes(canonical.read_bytes())
    result.operations.append(Operation("shared-config", canonical, shared))
    for identity, policy, source, target, committed, sha in records:
        result.operations.append(Operation("policy", policy, target / "policy.rego"))
        for name in FIXTURES:
            result.operations.append(Operation("fixture", source / name, target / name))
        config = source / "config.tf"
        if config != canonical:
            if canonical_text_bytes(config.read_bytes()) == canonical_bytes:
                result.operations.append(Operation("duplicate-config", config, None))
            else:
                result.operations.append(Operation("config-override", config, target / "config.tf"))
        result.operations.append(Operation("plan", committed, target / f"{sha}.json"))
        # Check the proposed effective file set before any moves, using source bytes.
        effective = {name: source / name for name in FIXTURES}
        effective["config.tf"] = canonical if canonical_text_bytes(config.read_bytes()) == canonical_bytes else config
        if sha_for_files(effective) != sha:
            raise Abort(f"Effective fixture hash would change: {identity}")

    destinations = set()
    for operation in result.operations:
        contained(root, operation.source)
        result.fingerprints[operation.source] = fingerprint(operation.source)
        if operation.destination is not None:
            contained(root, operation.destination)
            key = operation.destination.resolve()
            if key in destinations or operation.destination.exists():
                raise Abort(f"Destination collision: {operation.destination}")
            destinations.add(key)
            result.preserved[operation.destination] = result.fingerprints[operation.source]
    for vars_path in policies_root.rglob("_vars.rego"):
        contained(root, vars_path)
        result.fingerprints[vars_path] = fingerprint(vars_path)
        result.preserved[vars_path] = result.fingerprints[vars_path]
    return result


def apply(plan: Migration) -> None:
    """Apply a validated plan; recheck sources and targets before the first mutation."""
    if plan.already_migrated:
        return
    for source, expected in plan.fingerprints.items():
        contained(plan.root, source)
        if not source.is_file() or fingerprint(source) != expected:
            raise Abort(f"Source changed since preflight: {source}")
    for operation in plan.operations:
        if operation.destination is not None:
            contained(plan.root, operation.destination)
            if operation.destination.exists():
                raise Abort(f"Destination appeared since preflight: {operation.destination}")
    for operation in plan.operations:
        if operation.destination is None:
            operation.source.unlink()
        else:
            operation.destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(str(operation.source), str(operation.destination))
    # Only remove empty directories inside the selected old GCP tree.
    old = plan.root / "inputs/gcp"
    for directory in sorted((p for p in old.rglob("*") if p.is_dir()),
                            key=lambda p: len(p.parts), reverse=True):
        contained(plan.root, directory)
        if not any(directory.iterdir()):
            directory.rmdir()
    if old.is_dir() and not any(old.iterdir()):
        old.rmdir()
    for destination, expected in plan.preserved.items():
        if not destination.is_file() or fingerprint(destination) != expected:
            raise Abort(f"Post-migration content verification failed: {destination}")
    after = prepare(plan.root)
    if after.hashes != plan.hashes:
        raise Abort("Post-migration identity/hash verification failed")


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--apply", action="store_true", help="Apply the fully preflighted moves; default is dry-run")
    args = parser.parse_args(argv)
    root = args.repo_root.resolve()
    try:
        plan = prepare(root)
        if plan.already_migrated:
            print(f"[OK] Already migrated: verified {len(plan.hashes)} policy identities and committed plans; no changes")
            return 0
        counts = defaultdict(int)
        for operation in plan.operations:
            counts[operation.kind] += 1
        print(f"{'APPLY' if args.apply else 'DRY RUN'}: {root}")
        print(f"Verified {len(plan.hashes)} policy identities and unchanged effective fixture hashes")
        for kind, count in sorted(counts.items()):
            print(f"  {kind}: {count}")
        if args.apply:
            status = subprocess.run(["git", "status", "--porcelain", "--untracked-files=all"],
                                    cwd=root, capture_output=True, text=True)
            if status.returncode or status.stdout.strip():
                raise Abort("Apply requires a clean Git checkout; commit or stash changes first")
            apply(plan)
            print("[OK] Moves and content/hash verification complete. Nothing staged, committed or pushed")
        else:
            print("Dry run complete; nothing changed. Use --apply only at the final cutover")
        return 0
    except (Abort, OSError, ValueError) as exc:
        print(f"[ABORT] {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
