"""Cutover rehearsals operate only on synthetic temporary repositories."""
import json
from pathlib import Path
import subprocess

import pytest

from scripts.auto_test import auto_test as at
from scripts.migration import restructure_gcp as migration


CONFIG = b'terraform { required_providers { google = { source = "hashicorp/google" } } }\nprovider "google" {}\n'


def fixture(root, argument="location", config=CONFIG, resource="google_test"):
    resource_dir = root / "policies/gcp/Service With Spaces" / resource
    resource_dir.mkdir(parents=True, exist_ok=True)
    (resource_dir / f"{argument}.rego").write_text(
        f"package terraform.gcp.security.example.{resource}.{argument.replace('.', '_')}\n",
        encoding="utf-8")
    (resource_dir / "_vars.rego").write_text("package test.vars\nvariables := {}\n", encoding="utf-8")
    directory = root / "inputs/gcp/Service With Spaces" / resource / argument
    directory.mkdir(parents=True)
    (directory / "config.tf").write_bytes(config)
    (directory / "compliant.tf").write_bytes(b'# compliant fixture\n')
    (directory / "nonCompliant.tf").write_bytes(b'# noncompliant fixture\n')
    files = {p.name: p for p in directory.glob("*.tf")}
    sha = at.sha_for_files(files)
    (directory / f"{sha}.json").write_text(json.dumps({"planned_values": {"root_module": {"resources": []}}}), encoding="utf-8")
    return directory


def snapshot(root):
    return {p.relative_to(root).as_posix(): p.read_bytes() for p in root.rglob("*") if p.is_file()}


def test_dry_run_preserves_every_byte(tmp_path, capsys):
    fixture(tmp_path)
    before = snapshot(tmp_path)
    assert migration.main(["--repo-root", str(tmp_path)]) == 0
    assert "DRY RUN" in capsys.readouterr().out
    assert snapshot(tmp_path) == before


def test_move_preserves_content_identity_hash_and_vars(tmp_path):
    old = fixture(tmp_path, argument="nested.argument")
    before = snapshot(tmp_path)
    plan = migration.prepare(tmp_path)
    expected = dict(plan.hashes)
    migration.apply(plan)
    directory = tmp_path / "policies/gcp/Service With Spaces/google_test/nested.argument"
    assert (directory / "policy.rego").read_bytes() == before["policies/gcp/Service With Spaces/google_test/nested.argument.rego"]
    assert (directory / "compliant.tf").read_bytes() == before[old.relative_to(tmp_path).as_posix() + "/compliant.tf"]
    assert not (directory / "config.tf").exists()
    assert migration.prepare(tmp_path).hashes == expected
    assert at.verify_plan_cache([(directory, directory / "policy.rego")]) == 0
    migrated = snapshot(tmp_path)
    migration.apply(migration.prepare(tmp_path))
    assert snapshot(tmp_path) == migrated


def test_most_common_config_is_shared_and_other_configs_are_exact_overrides(tmp_path):
    special = CONFIG + b'locals { fixture_value = "keep me" }\n'
    fixture(tmp_path, "a", special)
    fixture(tmp_path, "b")
    fixture(tmp_path, "c", CONFIG.replace(b"\n", b"\r\n"))
    plan = migration.prepare(tmp_path)
    expected = dict(plan.hashes)
    migration.apply(plan)
    root = tmp_path / "policies/gcp"
    assert at.canonical_text_bytes((root / "config.tf").read_bytes()) == CONFIG
    assert (root / "Service With Spaces/google_test/a/config.tf").read_bytes() == special
    assert not (root / "Service With Spaces/google_test/b/config.tf").exists()
    assert not (root / "Service With Spaces/google_test/c/config.tf").exists()
    assert migration.prepare(tmp_path).hashes == expected


def test_equal_frequency_uses_source_path_order(tmp_path):
    fixture(tmp_path, "z", b"# config z\n")
    fixture(tmp_path, "a", b"# config a\n")
    plan = migration.prepare(tmp_path)
    assert plan.operations[0].source.parent.name == "a"


def test_whitespace_differences_remain_overrides_to_preserve_hashes(tmp_path):
    fixture(tmp_path, "a")
    fixture(tmp_path, "b", CONFIG + b"\n")
    migration.apply(migration.prepare(tmp_path))
    assert (tmp_path / "policies/gcp/Service With Spaces/google_test/b/config.tf").read_bytes() == CONFIG + b"\n"


def test_verified_old_crlf_name_is_renamed_without_replanning(tmp_path):
    old = fixture(tmp_path)
    expected = next(old.glob("*.json"))
    files = {p.name: p for p in old.glob("*.tf")}
    crlf_sha = at.sha_for_files(files, lambda b: at.canonical_text_bytes(b).replace(b"\n", b"\r\n"))
    expected.rename(old / f"{crlf_sha}.json")
    migration.apply(migration.prepare(tmp_path))
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/location"
    assert (target / expected.name).is_file()
    assert not (target / f"{crlf_sha}.json").exists()


@pytest.mark.parametrize("problem", ["missing", "stale", "extra", "invalid", "orphan", "target", "mixed", "central"])
def test_preflight_rejects_ambiguity_without_mutation(tmp_path, problem):
    old = fixture(tmp_path)
    plan = next(old.glob("*.json"))
    if problem == "missing":
        plan.unlink()
    elif problem == "stale":
        (old / "compliant.tf").write_bytes(b"# changed fixture\n")
    elif problem == "extra":
        (old / "plan.json").write_text("{}")
    elif problem == "invalid":
        plan.write_text("{}")
    elif problem == "orphan":
        (tmp_path / "inputs/gcp/orphan.tf").write_text("# orphan")
    elif problem == "target":
        (tmp_path / "policies/gcp/Service With Spaces/google_test/location").mkdir()
    elif problem == "mixed":
        directory = tmp_path / "policies/gcp/Service With Spaces/google_test/other"
        directory.mkdir()
        (directory / "policy.rego").write_text("package x\n")
    else:
        (tmp_path / "inputs/plan_cache/gcp").mkdir(parents=True)
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort):
        migration.prepare(tmp_path)
    assert snapshot(tmp_path) == before


def test_sources_are_rechecked_before_any_write(tmp_path):
    old = fixture(tmp_path)
    plan = migration.prepare(tmp_path)
    (old / "compliant.tf").write_bytes(b"# changed after preflight")
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match="Source changed"):
        migration.apply(plan)
    assert snapshot(tmp_path) == before


def test_new_destination_is_rechecked_before_any_write(tmp_path):
    fixture(tmp_path)
    plan = migration.prepare(tmp_path)
    target = plan.operations[-1].destination
    target.parent.mkdir(parents=True)
    target.write_text("new unrelated contents")
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match="Destination appeared"):
        migration.apply(plan)
    assert snapshot(tmp_path) == before


def test_migrated_noop_still_rejects_a_stale_plan(tmp_path):
    fixture(tmp_path)
    migration.apply(migration.prepare(tmp_path))
    (tmp_path / "policies/gcp/config.tf").write_bytes(b"# changed provider")
    with pytest.raises(migration.Abort, match="Partial migration"):
        migration.prepare(tmp_path)


def test_apply_accepts_a_clean_feature_branch_and_requires_clean_git(tmp_path):
    fixture(tmp_path)
    def git(*args):
        return subprocess.run(["git", *args], cwd=tmp_path, check=True, capture_output=True)
    git("init", "-q", "-b", "feature/restructure")
    git("-c", "user.name=Test", "-c", "user.email=test@example.com", "add", ".")
    git("-c", "user.name=Test", "-c", "user.email=test@example.com", "commit", "-qm", "fixtures")
    (tmp_path / "uncommitted.txt").write_text("do not migrate a dirty checkout")
    before = snapshot(tmp_path / "policies")
    assert migration.main(["--repo-root", str(tmp_path), "--apply"]) == 1
    assert snapshot(tmp_path / "policies") == before
    (tmp_path / "uncommitted.txt").unlink()
    assert migration.main(["--repo-root", str(tmp_path), "--apply"]) == 0
    assert git("branch", "--show-current").stdout.strip() == b"feature/restructure"


def test_unrelated_platform_data_is_preserved(tmp_path):
    fixture(tmp_path)
    other = tmp_path / "inputs/aws/keep.tf"
    other.parent.mkdir(parents=True)
    other.write_bytes(b"# unrelated platform")
    migration.apply(migration.prepare(tmp_path))
    assert other.read_bytes() == b"# unrelated platform"
