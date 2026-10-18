"""Cutover rehearsals operate only on synthetic temporary repositories."""
import json
from pathlib import Path
import subprocess

import pytest

from scripts.auto_test import auto_test as at
from scripts.migration import restructure_gcp as migration


CONFIG = b'terraform { required_providers { google = { source = "hashicorp/google" } } }\nprovider "google" {}\n'


def fixture(root, argument="location", config=CONFIG, resource="google_test"):
    pin = root / "scripts/auto_test/provider_version.txt"
    pin.parent.mkdir(parents=True, exist_ok=True)
    if not pin.exists():
        pin.write_text(at.TARGET_PROVIDER_VERSION, encoding="utf-8")
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
    sha = at.sha_for_files(files, repo_root=root)
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


def test_argument_named_policy_is_not_mistaken_for_migrated_layout(tmp_path):
    fixture(tmp_path, argument="policy")
    migration.apply(migration.prepare(tmp_path))
    assert (tmp_path / "policies/gcp/Service With Spaces/google_test/policy/policy.rego").is_file()


def test_migration_uses_selected_checkout_provider_pin(tmp_path, monkeypatch):
    pin = tmp_path / "scripts/auto_test/provider_version.txt"
    pin.parent.mkdir(parents=True)
    pin.write_text("selected-version")
    fixture(tmp_path)
    expected = migration.prepare(tmp_path).hashes
    monkeypatch.setattr(at, "TARGET_PROVIDER_VERSION", "other-version")
    migration.apply(migration.prepare(tmp_path))
    assert migration.prepare(tmp_path).hashes == expected


def test_provider_change_after_preflight_aborts_before_moving(tmp_path):
    fixture(tmp_path)
    plan = migration.prepare(tmp_path)
    (tmp_path / "scripts/auto_test/provider_version.txt").write_text("changed-version")
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match="Source changed"):
        migration.apply(plan)
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
    fixture(tmp_path, "z", b"# config z\n" + CONFIG)
    fixture(tmp_path, "a", b"# config a\n" + CONFIG)
    plan = migration.prepare(tmp_path)
    assert plan.operations[0].source.parent.name == "a"


def test_whitespace_only_configs_are_removed_and_changed_plans_invalidated(tmp_path):
    fixture(tmp_path, "a")
    old = fixture(tmp_path, "b", CONFIG + b"\n")
    old_sha = next(old.glob("*.json")).stem
    plan = migration.prepare(tmp_path)
    identity = ("Service With Spaces", "google_test", "b")
    assert plan.rebuilds[identity] == (old_sha, plan.hashes[identity])
    migration.apply(plan)
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/b"
    assert not (target / "config.tf").exists()
    assert not list(target.glob("*.json"))
    assert not (tmp_path / "inputs").exists()
    assert migration.prepare(tmp_path).pending == plan.pending
    kept = target.parent / "a"
    assert list(kept.glob("*.json")) == [at.plan_cache_path(kept, tmp_path)]


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
    with pytest.raises(migration.Abort, match="changed since preflight"):
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


@pytest.mark.parametrize("branch", ["feature/restructure", "Task/pde_folder_restructure"])
def test_apply_accepts_restructuring_branches_and_requires_clean_git(tmp_path, branch):
    fixture(tmp_path)
    def git(*args):
        return subprocess.run(["git", *args], cwd=tmp_path, check=True, capture_output=True)
    git("init", "-q", "-b", branch)
    git("-c", "user.name=Test", "-c", "user.email=test@example.com", "add", ".")
    git("-c", "user.name=Test", "-c", "user.email=test@example.com", "commit", "-qm", "fixtures")
    (tmp_path / "uncommitted.txt").write_text("do not migrate a dirty checkout")
    before = snapshot(tmp_path / "policies")
    assert migration.main(["--repo-root", str(tmp_path), "--apply"]) == 1
    assert snapshot(tmp_path / "policies") == before
    (tmp_path / "uncommitted.txt").unlink()
    assert migration.main(["--repo-root", str(tmp_path), "--apply"]) == 0
    assert git("branch", "--show-current").stdout.decode().strip() == branch


def test_unrelated_platform_data_aborts_without_mutation(tmp_path):
    fixture(tmp_path)
    other = tmp_path / "inputs/aws/keep.tf"
    other.parent.mkdir(parents=True)
    other.write_bytes(b"# unrelated platform")
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match="keep.tf"):
        migration.prepare(tmp_path)
    assert snapshot(tmp_path) == before


@pytest.mark.parametrize("config", [
    CONFIG, b"# DO NOT EDIT\n" + CONFIG,
    CONFIG.replace(b" ", b"\t").replace(b"\n", b"\r\n"),
    b"\xef\xbb\xbf" + CONFIG.replace(b"\n", b"\r"),
    CONFIG.replace(b"source", b"/* comment */source").replace(b"provider \"google\"", b"// comment\nprovider \"google\""),
])
def test_base_recognition_ignores_formatting_and_comments(config):
    assert migration.base_only(config)


@pytest.mark.parametrize("config", [
    CONFIG + b'locals { certificate_public_key = "sample" }\n',
    CONFIG + b'resource "terraform_data" "non_compliant_location" { input = "us-central1" }\n',
    b'resource "google_network_services_multicast_domain" "example" {}\n',
    CONFIG.replace(b'"hashicorp/google"', b'"hashicorp/google" version = "7.37.0"'),
    CONFIG.replace(b'provider "google" {}', b'provider "google" { alias = "other" }'),
    CONFIG.replace(b'provider "google" {}', b'provider "google" { project = "test" }'),
    CONFIG.replace(b'"hashicorp/google"', b'"hashicorp/*comment*/google"'),
    CONFIG.replace(b'"hashicorp/google"', b'"hashicorp/google#comment"'),
    CONFIG.replace(b'"hashicorp/google"', b'"hashicorp/ google"'),
    CONFIG.replace(b'"hashicorp/google"', b'"hashicorp/\\u0067oogle"'),
    CONFIG + b'/* unterminated', CONFIG + b'"unterminated', CONFIG + b'\xff',
])
def test_nonbase_and_uncertain_configs_are_not_consolidated(config):
    assert not migration.base_only(config)


def test_custom_configs_never_become_shared_even_when_most_common(tmp_path):
    special = CONFIG + b'locals { certificate_public_key = "sample" }\n'
    fixture(tmp_path, "base")
    fixture(tmp_path, "special_a", special)
    fixture(tmp_path, "special_b", special)
    plan = migration.prepare(tmp_path)
    assert plan.operations[0].source.parent.name == "base"
    expected = dict(plan.hashes)
    migration.apply(plan)
    for argument in ("special_a", "special_b"):
        target = tmp_path / "policies/gcp/Service With Spaces/google_test" / argument
        assert (target / "config.tf").read_bytes() == special
        assert list(target.glob("*.json")) == [at.plan_cache_path(target, tmp_path)]
    assert migration.prepare(tmp_path).hashes == expected


def test_no_base_config_fails_without_mutation(tmp_path):
    fixture(tmp_path, config=CONFIG + b'locals { key = "sample" }\n')
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match="No base-only"):
        migration.prepare(tmp_path)
    assert snapshot(tmp_path) == before


def test_all_empty_input_directories_and_placeholders_removed(tmp_path):
    old = fixture(tmp_path)
    for directory in (tmp_path / "inputs", old, old / "empty", tmp_path / "inputs/aws/empty",
                      tmp_path / "inputs/azure", tmp_path / "inputs/gcp/unused"):
        directory.mkdir(parents=True, exist_ok=True)
        (directory / ".gitkeep").touch()
    migration.apply(migration.prepare(tmp_path))
    assert not (tmp_path / "inputs").exists()


@pytest.mark.parametrize("relative,content", [
    ("aws/.gitkeep", b"not empty"), ("azure/remaining.tf", b"resource"),
    ("gcp/orphan.txt", b"orphan"), ("empty.txt", b""),
])
def test_unexpected_inputs_fail_entire_preflight(tmp_path, relative, content):
    fixture(tmp_path)
    path = tmp_path / "inputs" / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(content)
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match=path.name):
        migration.prepare(tmp_path)
    assert snapshot(tmp_path) == before


def test_all_unexpected_paths_are_reported(tmp_path):
    fixture(tmp_path)
    for name in ("one", "two"):
        (tmp_path / "inputs" / name).write_bytes(b"unexpected")
    with pytest.raises(migration.Abort) as exc:
        migration.prepare(tmp_path)
    assert "one" in str(exc.value) and "two" in str(exc.value)


@pytest.mark.parametrize("change", ["new-file", "new-directory", "changed-placeholder", "removed-placeholder"])
def test_cleanup_inventory_rechecked_before_any_mutation(tmp_path, change):
    fixture(tmp_path)
    placeholder = tmp_path / "inputs/.gitkeep"
    placeholder.touch()
    plan = migration.prepare(tmp_path)
    if change == "new-file":
        (tmp_path / "inputs/new.txt").write_text("preserve")
    elif change == "new-directory":
        (tmp_path / "inputs/new").mkdir()
    elif change == "changed-placeholder":
        placeholder.write_text("preserve")
    else:
        placeholder.unlink()
    before = snapshot(tmp_path)
    with pytest.raises(migration.Abort, match="cleanup targets changed"):
        migration.apply(plan)
    assert snapshot(tmp_path) == before


def test_cleanup_rechecks_targets_after_migration_verification(tmp_path, monkeypatch):
    fixture(tmp_path)
    placeholder = tmp_path / "inputs/.gitkeep"
    placeholder.touch()
    prepare_cleanup = migration.cleanup_inputs
    def changed_cleanup(root, expected):
        placeholder.write_bytes(b"preserve newly arrived data")
        prepare_cleanup(root, expected)
    monkeypatch.setattr(migration, "cleanup_inputs", changed_cleanup)
    with pytest.raises(migration.Abort, match="cleanup targets changed"):
        migration.apply(migration.prepare(tmp_path))
    assert placeholder.read_bytes() == b"preserve newly arrived data"


def test_cleanup_runs_only_after_destination_verification(tmp_path, monkeypatch):
    fixture(tmp_path)
    placeholder = tmp_path / "inputs/.gitkeep"
    placeholder.touch()
    move = migration.shutil.move
    def corrupt_move(source, destination):
        move(source, destination)
        if Path(destination).name == "compliant.tf":
            Path(destination).write_bytes(b"corrupt")
    monkeypatch.setattr(migration.shutil, "move", corrupt_move)
    with pytest.raises(migration.Abort, match="content verification failed"):
        migration.apply(migration.prepare(tmp_path))
    assert placeholder.exists()


def test_pending_regeneration_then_verified_noop(tmp_path, capsys):
    fixture(tmp_path, "a")
    fixture(tmp_path, "b", CONFIG + b"\n")
    before = snapshot(tmp_path)
    assert migration.main(["--repo-root", str(tmp_path)]) == 0
    report = capsys.readouterr().out
    plan = migration.prepare(tmp_path)
    old, new = next(iter(plan.rebuilds.values()))
    assert old in report and new in report and "[REBUILD]" in report
    assert snapshot(tmp_path) == before
    migration.apply(plan)
    assert migration.main(["--repo-root", str(tmp_path)]) == 2
    report = capsys.readouterr().out
    assert "[PENDING]" in report and "no changes" not in report
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/b"
    at.plan_cache_path(target, tmp_path).write_text('{"planned_values": {}}')
    before = snapshot(tmp_path)
    assert migration.main(["--repo-root", str(tmp_path)]) == 0
    assert "Already migrated" in capsys.readouterr().out
    assert snapshot(tmp_path) == before


def test_future_override_survives_verification_and_cleanup_only(tmp_path):
    fixture(tmp_path)
    migration.apply(migration.prepare(tmp_path))
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/location"
    next(target.glob("*.json")).unlink()
    override = CONFIG + b'locals { future_value = "keep" }\n'
    (target / "config.tf").write_bytes(override)
    at.plan_cache_path(target, tmp_path).write_text('{"planned_values": {}}')
    assert at.fixture_files(target, tmp_path)["config.tf"] == target / "config.tf"
    leftovers = tmp_path / "inputs/aws/empty"
    leftovers.mkdir(parents=True)
    (leftovers / ".gitkeep").touch()
    before = snapshot(tmp_path / "policies")
    plan = migration.prepare(tmp_path)
    assert plan.already_migrated and plan.input_inventory
    migration.apply(plan)
    assert not (tmp_path / "inputs").exists()
    assert snapshot(tmp_path / "policies") == before
    assert not migration.prepare(tmp_path).pending


def test_cleanup_only_still_requires_clean_git(tmp_path, monkeypatch, capsys):
    fixture(tmp_path)
    migration.apply(migration.prepare(tmp_path))
    (tmp_path / "inputs").mkdir()
    before = snapshot(tmp_path)
    monkeypatch.setattr(migration.subprocess, "run", lambda *a, **k:
                        subprocess.CompletedProcess(a, 0, " M changed\n", ""))
    assert migration.main(["--repo-root", str(tmp_path), "--apply"]) == 1
    assert "clean Git checkout" in capsys.readouterr().err
    assert (tmp_path / "inputs").exists()
    assert snapshot(tmp_path) == before


def test_input_links_rejected_before_mutation(tmp_path):
    fixture(tmp_path)
    outside = tmp_path / "outside"
    outside.mkdir()
    link = tmp_path / "inputs/linked"
    try:
        link.symlink_to(outside, target_is_directory=True)
    except OSError:
        pytest.skip("Creating symlinks requires Windows privileges")
    with pytest.raises(migration.Abort, match="Links"):
        migration.prepare(tmp_path)
    assert outside.exists()


@pytest.mark.parametrize("special", [
    CONFIG + b'locals { certificate_public_key = "sample" }\n',
    CONFIG + b'resource "terraform_data" "non_compliant_location" { input = "us-central1" }\n',
    b'resource "google_network_services_multicast_domain" "example" {}\n'
    b'resource "google_network_connectivity_internal_range" "mcast_range" {}\n',
    CONFIG.replace(b'provider "google" {}', b'provider "google" { project = "test" }'),
])
def test_meaningful_overrides_and_plan_bytes_survive_migration(tmp_path, special):
    fixture(tmp_path, "base")
    source = fixture(tmp_path, "special", special)
    source_plan = next(source.glob("*.json"))
    original_plan = source_plan.read_bytes()
    plan = migration.prepare(tmp_path)
    assert not plan.rebuilds
    migration.apply(plan)
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/special"
    assert (target / "config.tf").read_bytes() == special
    assert (target / source_plan.name).read_bytes() == original_plan
    assert at.fixture_files(target, tmp_path)["config.tf"] == target / "config.tf"


def test_historical_plan_for_changed_base_is_removed_not_renamed(tmp_path):
    fixture(tmp_path, "a")
    old = fixture(tmp_path, "b", CONFIG + b"\n")
    files = {p.name: p for p in old.glob("*.tf")}
    historic = at.sha_for_files(files, lambda b: at.canonical_text_bytes(b).replace(b"\n", b"\r\n"),
                               repo_root=tmp_path)
    next(old.glob("*.json")).rename(old / f"{historic}.json")
    migration.apply(migration.prepare(tmp_path))
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/b"
    assert not list(target.glob("*.json"))


def test_apply_reports_pending_and_cleanup_only_can_finish(tmp_path, monkeypatch, capsys):
    fixture(tmp_path, "a")
    fixture(tmp_path, "b", CONFIG + b"\n")
    monkeypatch.setattr(migration.subprocess, "run", lambda *a, **k:
                        subprocess.CompletedProcess(a, 0, "", ""))
    args = ["--repo-root", str(tmp_path), "--apply"]
    assert migration.main(args) == 2
    assert "[REQUIRED]" in capsys.readouterr().out
    assert not (tmp_path / "inputs").exists()
    (tmp_path / "inputs/azure").mkdir(parents=True)
    (tmp_path / "inputs/azure/.gitkeep").touch()
    assert migration.main(args) == 2
    assert not (tmp_path / "inputs").exists()
    target = tmp_path / "policies/gcp/Service With Spaces/google_test/b"
    at.plan_cache_path(target, tmp_path).write_text('{"planned_values": {}}')
    (tmp_path / "inputs").mkdir()
    assert migration.main(args) == 0
    assert not (tmp_path / "inputs").exists()


def test_cleanup_only_dry_run_preserves_empty_directories(tmp_path, capsys):
    fixture(tmp_path)
    migration.apply(migration.prepare(tmp_path))
    empty = tmp_path / "inputs/aws/empty"
    empty.mkdir(parents=True)
    before = snapshot(tmp_path)
    assert migration.main(["--repo-root", str(tmp_path)]) == 0
    assert "cleanup:" in capsys.readouterr().out
    assert empty.is_dir()
    assert snapshot(tmp_path) == before


def test_cleanup_only_reports_unexpected_files(tmp_path):
    fixture(tmp_path)
    migration.apply(migration.prepare(tmp_path))
    (tmp_path / "inputs").mkdir()
    unexpected = tmp_path / "inputs/keep.tf"
    unexpected.write_bytes(b"preserve")
    with pytest.raises(migration.Abort, match="keep.tf"):
        migration.prepare(tmp_path)
    assert unexpected.read_bytes() == b"preserve"
