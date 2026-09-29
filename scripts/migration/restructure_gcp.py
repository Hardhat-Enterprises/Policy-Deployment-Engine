"""Deferred GCP cutover. Dry-run by default; never invokes git writes, Terraform or OPA.

The input is current dev's flat policies and fixture-local <sha>.json plans.
The output co-locates policy.rego, both fixtures and their plan under policies/.
One base-only shared config is selected by normalized frequency; configs with
additional declarations remain local overrides. Formatting-only consolidation
can invalidate plans, which must then be regenerated with the normal harness.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
from dataclasses import dataclass, field
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from scripts.auto_test.auto_test import (
    PLAN_FILE_RE, canonical_text_bytes, fixture_sha,
    plan_cache_path, sha_for_files,
)

FIXTURES = ("compliant.tf", "nonCompliant.tf")
BASE_CONFIG = b'''terraform {
  required_providers {
    google = { source = "hashicorp/google" }
  }
}
provider "google" {}
'''
# Deliberately a small lexer, not a Terraform semantic-equivalence parser.
# Unsupported tokens and malformed strings/comments fail closed as overrides.
CONFIG_TOKEN = re.compile(
    r'(?P<space>[ \t\n]+)|(?P<comment>\#[^\n]*|//[^\n]*|/\*[\s\S]*?\*/)'
    r'|(?P<string>"(?:[^"\\\n]|\\[^\n])*")'
    r'|(?P<identifier>[A-Za-z_][A-Za-z_0-9-]*)|(?P<punct>[{}=])'
)


def config_tokens(data: bytes) -> tuple[str, ...] | None:
    try:
        text = canonical_text_bytes(data).decode("utf-8")
    except UnicodeDecodeError:
        return None
    tokens = []
    offset = 0
    while offset < len(text):
        match = CONFIG_TOKEN.match(text, offset)
        if match is None:
            return None
        if match.lastgroup not in {"space", "comment"}:
            tokens.append(match.group())
        offset = match.end()
    return tuple(tokens)


def base_only(data: bytes) -> bool:
    return config_tokens(data) == config_tokens(BASE_CONFIG)


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
    # logical (service, resource, argument) -> effective destination hash
    hashes: dict[tuple[str, str, str], str] = field(default_factory=dict)
    rebuilds: dict[tuple[str, str, str], tuple[str, str]] = field(default_factory=dict)
    pending: dict[tuple[str, str, str], str] = field(default_factory=dict)
    input_inventory: dict[Path, str] = field(default_factory=dict)
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
    for part in (path, *path.parents):
        if part == root:
            break
        if part.is_symlink() or (hasattr(part, "is_junction") and part.is_junction()):
            raise Abort(f"Links cannot be migrated safely: {part}")


def input_inventory(root: Path) -> dict[Path, str]:
    """Inventory without following directory links, including the inputs root."""
    old = root / "inputs"
    contained(root, old)
    if not old.exists():
        return {}
    if not old.is_dir():
        raise Abort(f"Expected an input directory: {old}")
    inventory = {}
    todo = [old]
    while todo:
        path = todo.pop()
        contained(root, path)
        if path.is_dir():
            inventory[path] = "directory"
            todo.extend(sorted(path.iterdir()))
        elif path.is_file():
            inventory[path] = fingerprint(path)
        else:
            raise Abort(f"Unexpected input entry: {path}")
    return inventory


def validate_inputs(inventory: dict[Path, str], sources: set[Path]) -> None:
    empty = hashlib.sha256(b"").hexdigest()
    unexpected = [p for p, value in inventory.items()
                  if value != "directory" and p not in sources
                  and not (p.name == ".gitkeep" and value == empty)]
    if unexpected:
        raise Abort("Unexpected input contents; migration cannot remove inputs/:\n" +
                    "\n".join(str(p) for p in sorted(unexpected)))


def recheck_inputs(root: Path, expected: dict[Path, str]) -> None:
    current = input_inventory(root)
    changed = [p for p in current.keys() | expected.keys() if current.get(p) != expected.get(p)]
    if changed:
        raise Abort("Input cleanup targets changed since preflight:\n" +
                    "\n".join(str(p) for p in sorted(changed)))


def cleanup_inputs(root: Path, expected: dict[Path, str]) -> None:
    """Delete only verified empty placeholders and directories, never recursively."""
    recheck_inputs(root, expected)
    validate_inputs(expected, set())
    for path, value in expected.items():
        if value != "directory":
            contained(root, path)
            if not path.is_file() or path.read_bytes() != b"":
                raise Abort(f"Cleanup placeholder changed: {path}")
            path.unlink()
    for path in sorted((p for p, value in expected.items() if value == "directory"),
                       key=lambda p: len(p.parts), reverse=True):
        contained(root, path)
        if not path.is_dir() or any(path.iterdir()):
            raise Abort(f"Cleanup directory is no longer empty: {path}")
        path.rmdir()


def valid_plan(path: Path) -> None:
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        if not isinstance(data, dict) or not isinstance(data.get("planned_values"), dict):
            raise ValueError("missing planned_values object")
    except (OSError, ValueError) as exc:
        raise Abort(f"Invalid Terraform plan {path}: {exc}") from exc


def source_plan(directory: Path, files: dict[str, Path], sha: str, root: Path) -> Path:
    """Accept only the current hash or a provably equivalent old text spelling."""
    alternatives = {sha_for_files(files, lambda b: b, repo_root=root),
                    sha_for_files(files, lambda b: canonical_text_bytes(b).replace(b"\n", b"\r\n"), repo_root=root)}
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
    for path in [shared, root / "scripts/auto_test/provider_version.txt",
                 *(root / "policies/gcp").rglob("_vars.rego")]:
        contained(root, path)
        plan.fingerprints[path] = fingerprint(path)
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
        if plans and plans != [expected]:
            raise Abort(f"Partial migration: expected only {expected}")
        identity = tuple(rel.parts[:3])
        if plans:
            valid_plan(expected)
        else:
            plan.pending[identity] = sha
        if identity in plan.hashes:
            raise Abort(f"Duplicate policy identity: {identity}")
        plan.hashes[identity] = sha
        for child in directory.iterdir():
            plan.fingerprints[child] = fingerprint(child)
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
    inventory = input_inventory(root)
    regos = sorted(policies_root.rglob("*.rego"))
    nested = [p for p in regos if p.name == "policy.rego" and len(p.relative_to(policies_root).parts) == 4]
    flat = [p for p in regos if p.name != "_vars.rego" and p not in nested]
    if nested:
        if flat:
            raise Abort("Partial/mixed migration: both old and new policy/fixture paths exist")
        validate_inputs(inventory, set())
        result = _verify_migrated(root, nested)
        result.input_inventory = inventory
        return result
    if not flat:
        raise Abort("No policies found to migrate")
    shared = policies_root / "config.tf"
    if shared.exists():
        raise Abort(f"Partial migration: target already exists: {shared}")
    if (root / "plan_cache").exists() or (root / "inputs/plan_cache").exists():
        raise Abort("Legacy central plan cache remains; sync dev's fixture-local plans before cutover")

    result = Migration(root, input_inventory=inventory)
    pin = root / "scripts/auto_test/provider_version.txt"
    result.fingerprints[pin] = fingerprint(pin)
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
        files = {name: source / name for name in required}
        sha = sha_for_files(files, repo_root=root)
        committed = source_plan(source, files, sha, root)
        config_bytes = files["config.tf"].read_bytes()
        if base_only(config_bytes):
            config_groups[canonical_text_bytes(config_bytes)].append(files["config.tf"])
        records.append((identity, policy, source, target, committed, sha))
        accounted.update(files.values())
        accounted.add(committed)
    validate_inputs(inventory, accounted)
    if not config_groups:
        raise Abort("No base-only config.tf found. Provide a fixture with the standard "
                    "Google provider configuration and a valid source plan before migration")

    # Stable tie-break: lexical repository-relative source path, independent of discovery order.
    canonical_group = min(config_groups.values(), key=lambda group: (
        -len(group), min(p.relative_to(root).as_posix() for p in group)))
    canonical = min(canonical_group, key=lambda p: p.relative_to(root).as_posix())
    result.operations.append(Operation("shared-config", canonical, shared))
    for identity, policy, source, target, committed, sha in records:
        result.operations.append(Operation("policy", policy, target / "policy.rego"))
        for name in FIXTURES:
            result.operations.append(Operation("fixture", source / name, target / name))
        config = source / "config.tf"
        uses_shared = base_only(config.read_bytes())
        if config != canonical:
            if uses_shared:
                result.operations.append(Operation("duplicate-config", config, None))
            else:
                result.operations.append(Operation("config-override", config, target / "config.tf"))
        # Determine whether the original plan can still represent the destination.
        effective = {name: source / name for name in FIXTURES}
        effective["config.tf"] = canonical if uses_shared else config
        destination_sha = sha_for_files(effective, repo_root=root)
        result.hashes[identity] = destination_sha
        if destination_sha == sha:
            result.operations.append(Operation("plan", committed, target / f"{sha}.json"))
        else:
            result.operations.append(Operation("invalidated-plan", committed, None))
            result.rebuilds[identity] = (sha, destination_sha)
            result.pending[identity] = destination_sha

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
    recheck_inputs(plan.root, plan.input_inventory)
    for source, expected in plan.fingerprints.items():
        contained(plan.root, source)
        if not source.is_file() or fingerprint(source) != expected:
            raise Abort(f"Source changed since preflight: {source}")
    for operation in plan.operations:
        if operation.destination is not None:
            contained(plan.root, operation.destination)
            if operation.destination.exists():
                raise Abort(f"Destination appeared since preflight: {operation.destination}")
    if plan.already_migrated:
        current = prepare(plan.root)
        if current.hashes != plan.hashes or current.pending != plan.pending:
            raise Abort("Migrated tree changed since preflight")
    for operation in plan.operations:
        if operation.destination is None:
            operation.source.unlink()
        else:
            operation.destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(str(operation.source), str(operation.destination))
    for destination, expected in plan.preserved.items():
        if not destination.is_file() or fingerprint(destination) != expected:
            raise Abort(f"Post-migration content verification failed: {destination}")
    after = _verify_migrated(plan.root, sorted((plan.root / "policies/gcp").glob("*/*/*/policy.rego")))
    if after.hashes != plan.hashes or after.pending != plan.pending:
        raise Abort("Post-migration identity/hash/plan verification failed")
    consumed = {op.source for op in plan.operations}
    remaining = {p: value for p, value in plan.input_inventory.items() if p not in consumed}
    cleanup_inputs(plan.root, remaining)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--apply", action="store_true", help="Apply the fully preflighted moves; default is dry-run")
    args = parser.parse_args(argv)
    root = args.repo_root.resolve()
    try:
        plan = prepare(root)
        if plan.already_migrated and not plan.pending and not plan.input_inventory:
            print(f"[OK] Already migrated: verified {len(plan.hashes)} policy identities and committed plans; no changes")
            return 0
        counts = defaultdict(int)
        for operation in plan.operations:
            counts[operation.kind] += 1
        print(f"{'APPLY' if args.apply else 'DRY RUN'}: {root}")
        print(f"Verified {len(plan.hashes)} policy identities; {len(plan.pending)} plans require regeneration")
        for kind, count in sorted(counts.items()):
            print(f"  {kind}: {count}")
        if plan.input_inventory:
            print("  cleanup: verified empty placeholders and directories, including inputs/")
        for identity, (old, new) in sorted(plan.rebuilds.items()):
            print(f"[REBUILD] {' / '.join(identity)}: {old} -> {new}")
        if plan.already_migrated:
            for identity, sha in sorted(plan.pending.items()):
                print(f"[PENDING] {' / '.join(identity)}: missing {sha}.json")
        if args.apply:
            status = subprocess.run(["git", "status", "--porcelain", "--untracked-files=all"],
                                    cwd=root, capture_output=True, text=True, encoding="utf-8", errors="replace")
            if status.returncode or status.stdout.strip():
                raise Abort("Apply requires a clean Git checkout; commit or stash changes first")
            apply(plan)
            print("[OK] Migration and input cleanup complete; contents, identities and plan disposition verified. "
                  "Nothing staged, committed or pushed")
        else:
            print("Dry run complete; nothing changed. Use --apply only at the final cutover")
        if plan.pending:
            print("[REQUIRED] Regenerate missing plans with: python scripts/auto_test/auto_test.py gcp")
            print("Then run gcp --verify-plan-cache and full policy evaluation before committing migrated data")
            if args.apply or plan.already_migrated:
                return 2
        return 0
    except (Abort, OSError, ValueError) as exc:
        print(f"[ABORT] {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
