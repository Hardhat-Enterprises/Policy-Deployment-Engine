"""Versioning uses migrated argument directories and preserves policy identities."""
import json
import sys

import pytest

from scripts.versioning import build_results


@pytest.fixture
def resource_tree(tmp_path):
    target = "gcp/Service With Spaces/google_example"
    resource = tmp_path / "policies" / target
    resource.mkdir(parents=True)
    (resource / "_vars.rego").write_text("# metadata\n")
    (resource / "drift_exemptions.json").write_text("{}")
    (resource / "unrelated").mkdir()
    for argument in ["nested.argument", "location"]:
        directory = resource / argument
        directory.mkdir()
        (directory / "policy.rego").write_text("# policy\n")
    return tmp_path, target


def test_discovery_uses_policy_files_not_metadata_or_arbitrary_directories(resource_tree):
    root, target = resource_tree
    assert build_results.list_argument_folders(str(root), target) == ["location", "nested.argument"]


@pytest.mark.parametrize("passed", [True, False])
def test_bridge_preserves_ids_and_only_writes_successful_results(resource_tree, monkeypatch, passed):
    root, target = resource_tree
    output = root / "results.json"
    monkeypatch.setattr(sys, "argv", ["build_results.py", "--repo", str(root),
                                     "--resource", target, "--version", "7.0.0",
                                     "--out", str(output)])
    monkeypatch.setattr(build_results, "run_auto_test", lambda *_:
                        "2/2 all passed" if passed else "1/2 failed")
    if passed:
        build_results.main()
        assert json.loads(output.read_text()) == {
            "google_example::location": {"7.0.0": True},
            "google_example::nested.argument": {"7.0.0": True},
        }
    else:
        with pytest.raises(SystemExit):
            build_results.main()
        assert not output.exists()
