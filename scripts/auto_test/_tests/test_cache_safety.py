"""Exercise cache publication failures and checkout isolation without Terraform."""
import json
from pathlib import Path
from types import SimpleNamespace

import pytest

from scripts.auto_test import auto_test as at
from scripts.linters import linter


@pytest.fixture
def fixture(tmp_path):
    directory = tmp_path / "policies/gcp/Service With Spaces/google_test/nested.argument"
    directory.mkdir(parents=True)
    (tmp_path / "policies/gcp/config.tf").write_bytes(b"# shared\n")
    for name in at.FIXTURE_TF_FILES:
        (directory / name).write_bytes(b"# fixture\n")
    (directory / "policy.rego").write_text("package test\n")
    pin = tmp_path / "scripts/auto_test/provider_version.txt"
    pin.parent.mkdir(parents=True)
    pin.write_text("1.2.3")
    return tmp_path, directory


def test_local_config_replaces_shared_and_changes_only_its_own_hash(fixture):
    root, directory = fixture
    inherited = at.fixture_sha(directory, root)
    local = directory / "config.tf"
    local.write_bytes(b"# override\nlocals { x = 1 }\n")
    overridden = at.fixture_sha(directory, root)
    assert inherited != overridden
    assert at.fixture_files(directory, root)["config.tf"] == local
    (root / "policies/gcp/config.tf").write_bytes(b"# changed shared\n")
    assert at.fixture_sha(directory, root) == overridden


def test_provider_pin_belongs_to_selected_checkout(fixture, monkeypatch):
    root, directory = fixture
    before = at.fixture_sha(directory, root)
    monkeypatch.setattr(at, "TARGET_PROVIDER_VERSION", "unrelated checkout")
    assert at.fixture_sha(directory, root) == before
    assert at.fixture_sha(directory) == before
    pin = root / "scripts/auto_test/provider_version.txt"
    pin.write_text("4.5.6")
    assert at.fixture_sha(directory, root) != before
    pin.unlink()
    with pytest.raises(FileNotFoundError):
        at.fixture_sha(directory, root)


@pytest.mark.parametrize("output", [None, "invalid JSON", "{}"])
def test_failed_build_preserves_previous_plan(fixture, monkeypatch, output):
    _, directory = fixture
    previous = at.plan_cache_path(directory)
    previous.write_text('{"planned_values": {}}')
    (directory / "compliant.tf").write_text("# edited fixture\n")
    replacement = at.plan_cache_path(directory)
    monkeypatch.setattr(at, "run_terraform_commands", lambda *_: output)
    assert at.get_or_build_plan(directory, replacement) is None
    assert previous.read_text() == '{"planned_values": {}}'
    assert not replacement.exists()


def test_atomic_publication_failure_preserves_old_plan_and_cleans_temp(fixture, monkeypatch):
    _, directory = fixture
    previous = at.plan_cache_path(directory)
    previous.write_text('{"planned_values": {}}')
    (directory / "compliant.tf").write_text("# changed\n")
    replacement = at.plan_cache_path(directory)
    monkeypatch.setattr(at, "run_terraform_commands", lambda *_: '{"planned_values": {}}')

    def fail_publish(source, destination):
        assert source != destination
        assert json.loads(source.read_text()) == {"planned_values": {}}
        assert previous.exists()
        raise OSError("simulated publication failure")

    monkeypatch.setattr(at.os, "replace", fail_publish)
    with pytest.raises(OSError, match="publication failure"):
        at.get_or_build_plan(directory, replacement)
    assert previous.exists()
    assert not replacement.exists()
    assert not list(directory.glob("*.tmp"))


def test_valid_cache_skips_build_and_only_then_prunes(fixture, monkeypatch):
    _, directory = fixture
    expected = at.plan_cache_path(directory)
    stale = directory / ("0" * 64 + ".json")
    stale.write_text('{"planned_values": {}}')
    assert at.prune_stale_plans(directory, expected) == 0
    expected.write_text("{}")
    assert at.prune_stale_plans(directory, expected) == 0
    expected.write_text('{"planned_values": {}}')

    def no_build(*_):
        pytest.fail("valid cached plans must not invoke Terraform")

    monkeypatch.setattr(at, "run_terraform_commands", no_build)
    assert at.get_or_build_plan(directory, expected) == expected
    assert not stale.exists()


def test_invalid_historical_plan_is_not_adopted(fixture):
    _, directory = fixture
    old = directory / (at.alternate_fixture_shas(directory)[0] + ".json")
    old.write_text("{}")
    assert not at.adopt_denormalised_plan(directory, at.plan_cache_path(directory))
    assert old.exists()


def test_verification_rejects_stale_plan_without_mutation(fixture):
    _, directory = fixture
    at.plan_cache_path(directory).write_text('{"planned_values": {}}')
    (directory / ("0" * 64 + ".json")).write_text("{}")
    before = {p.name: p.read_bytes() for p in directory.iterdir()}
    assert at.verify_plan_cache([(directory, directory / "policy.rego")]) == 1
    assert {p.name: p.read_bytes() for p in directory.iterdir()} == before


def test_terraform_uses_short_workspace_and_selected_config(fixture, monkeypatch):
    root, directory = fixture
    (directory / "config.tf").write_text("# local override\n")
    workspaces = []

    def run(command, **kwargs):
        work = Path(kwargs["cwd"])
        workspaces.append(work)
        assert work != directory and root not in work.parents
        assert work.name.startswith("pde-tf-")
        assert (work / "config.tf").read_text() == "# local override\n"
        assert kwargs["env"]["TF_CLI_CONFIG_FILE"] == str(root / ".terraform-cache/cli.tfrc")
        return SimpleNamespace(returncode=0, stdout='{"planned_values": {}}', stderr="")

    monkeypatch.setattr(at.subprocess, "run", run)
    assert json.loads(at.run_terraform_commands(directory)) == {"planned_values": {}}
    assert len(workspaces) == 3
    assert all(not p.exists() for p in workspaces)


def test_structural_validation_requires_valid_current_plan(fixture):
    root, directory = fixture
    expected = at.plan_cache_path(directory)
    logger = linter.ErrorLogger()
    validator = linter.PoliciesValidator(str(root / "policies"), {}, logger)
    validator.ignored = set()
    rel = directory.relative_to(root).as_posix()
    expected.write_text("{}")
    validator.validate_argument_dir(str(directory), rel)
    assert any("invalid committed" in error for error in logger.errors)
    logger.errors.clear()
    expected.write_text('{"planned_values": {}}')
    validator.validate_argument_dir(str(directory), rel)
    assert logger.errors == []
    (directory / "compliant.tf").write_text("# changed\n")
    validator.validate_argument_dir(str(directory), rel)
    assert any("missing committed" in error for error in logger.errors)
    assert any("stale" in error for error in logger.errors)
