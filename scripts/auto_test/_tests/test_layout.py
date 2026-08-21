"""Unit tests for the layout logic in auto_test.

These cover the functions that decide *where things live* and *what a cache key is* --
previously untested, and the parts most likely to break silently: a wrong cache key
just re-runs terraform (slow but green in CI), and a wrong discovery rule just tests
fewer policies.

The module resolves its roots at import time, so each test points POLICIES_ROOT and
PLAN_CACHE_ROOT at a tmp_path tree.
"""
import hashlib
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test  # noqa: E402

CONFIG_TF = b'terraform {\n  required_providers {\n    google = {\n'  \
            b'      source  = "hashicorp/google"\n    }\n  }\n}\n\nprovider "google" {}\n'
COMPLIANT_TF = b'resource "google_storage_bucket" "compliant_example_1" {\n  name = "ok"\n}\n'
NONCOMPLIANT_TF = b'resource "google_storage_bucket" "non_compliant_example_1" {\n  name = "bad"\n}\n'


@pytest.fixture
def tree(tmp_path, monkeypatch):
    """A minimal new-layout repo: one platform config + one complete policy."""
    policies = tmp_path / "policies"
    arg_dir = policies / "gcp" / "Cloud Storage" / "google_storage_bucket" / "public_access_prevention"
    arg_dir.mkdir(parents=True)
    (policies / "gcp" / "config.tf").write_bytes(CONFIG_TF)
    (arg_dir / "compliant.tf").write_bytes(COMPLIANT_TF)
    (arg_dir / "nonCompliant.tf").write_bytes(NONCOMPLIANT_TF)
    (arg_dir / "policy.rego").write_text("package terraform.gcp.security.x\n", encoding="utf-8")

    monkeypatch.setattr(auto_test, "POLICIES_ROOT", policies)
    monkeypatch.setattr(auto_test, "PLAN_CACHE_ROOT", tmp_path / "plan_cache")
    return tmp_path, policies, arg_dir


def legacy_sha(input_dir, provider):
    """The pre-migration hash: every *.tf in the fixture dir, raw bytes, config.tf included.

    Reproduced here so the cache-preservation test below is anchored to the real old
    algorithm rather than to the new one restated.
    """
    h = hashlib.sha256()
    h.update(f"provider={provider}\n".encode())
    for tf in sorted(input_dir.glob("*.tf")):
        h.update(tf.name.encode())
        h.update(b"\0")
        h.update(tf.read_bytes())
        h.update(b"\0")
    return h.hexdigest()


class TestPlatformOf:
    def test_returns_platform_segment(self, tree):
        _tmp, _policies, arg_dir = tree
        assert auto_test.platform_of(arg_dir) == "gcp"

    def test_rejects_path_outside_policies_root(self, tree):
        tmp, _policies, _arg_dir = tree
        with pytest.raises(ValueError):
            auto_test.platform_of(tmp / "elsewhere" / "gcp" / "a" / "b" / "c")


class TestFixtureFiles:
    def test_includes_shared_config_under_its_own_name(self, tree):
        _tmp, policies, arg_dir = tree
        files = auto_test.fixture_files(arg_dir)
        assert set(files) == {"compliant.tf", "nonCompliant.tf", "config.tf"}
        # config.tf comes from the platform root, not the argument dir
        assert files["config.tf"] == policies / "gcp" / "config.tf"
        assert not (arg_dir / "config.tf").exists()


class TestFixtureSha:
    def test_crlf_and_lf_hash_identically(self, tree):
        """The Windows cache bug: a CRLF checkout must produce the same key as LF."""
        _tmp, _policies, arg_dir = tree
        lf = auto_test.fixture_sha(arg_dir)

        for name in ("compliant.tf", "nonCompliant.tf"):
            p = arg_dir / name
            p.write_bytes(p.read_bytes().replace(b"\n", b"\r\n"))
        crlf = auto_test.fixture_sha(arg_dir)

        assert crlf == lf

    def test_matches_legacy_key_so_committed_cache_survives(self, tmp_path, tree):
        """The migration must not invalidate the ~1000 committed plans.

        Builds the OLD layout (config.tf duplicated into the fixture dir) beside the new
        one and asserts both hash the same. This is what lets the cutover happen without
        re-planning every fixture.
        """
        _tmp, _policies, arg_dir = tree
        legacy_dir = tmp_path / "legacy_fixture"
        legacy_dir.mkdir()
        (legacy_dir / "compliant.tf").write_bytes(COMPLIANT_TF)
        (legacy_dir / "nonCompliant.tf").write_bytes(NONCOMPLIANT_TF)
        (legacy_dir / "config.tf").write_bytes(CONFIG_TF)

        expected = legacy_sha(legacy_dir, auto_test.TARGET_PROVIDER_VERSION)
        assert auto_test.fixture_sha(arg_dir) == expected

    def test_changes_when_a_fixture_changes(self, tree):
        _tmp, _policies, arg_dir = tree
        before = auto_test.fixture_sha(arg_dir)
        (arg_dir / "compliant.tf").write_bytes(COMPLIANT_TF.replace(b'"ok"', b'"different"'))
        assert auto_test.fixture_sha(arg_dir) != before

    def test_changes_when_shared_config_changes(self, tree):
        """config.tf is shared, so editing it must invalidate every fixture's plan."""
        _tmp, policies, arg_dir = tree
        before = auto_test.fixture_sha(arg_dir)
        (policies / "gcp" / "config.tf").write_bytes(CONFIG_TF.replace(b"google", b"google-beta"))
        assert auto_test.fixture_sha(arg_dir) != before


class TestPlanCachePath:
    def test_lands_under_plan_cache_platform(self, tree):
        tmp, _policies, arg_dir = tree
        path = auto_test.plan_cache_path(arg_dir)
        assert path.parent == tmp / "plan_cache" / "gcp"
        assert path.name == f"{auto_test.fixture_sha(arg_dir)}.json"


class TestDiscoverPolicies:
    def test_finds_a_complete_policy(self, tree):
        _tmp, policies, arg_dir = tree
        pairs, malformed = auto_test.discover_policies(policies)
        assert malformed == []
        assert pairs == [(arg_dir, arg_dir / "policy.rego")]

    def test_platform_config_is_not_a_policy(self, tree):
        """policies/gcp/config.tf is a lone .tf with no policy.rego -- not an error."""
        _tmp, policies, _arg_dir = tree
        _pairs, malformed = auto_test.discover_policies(policies)
        assert malformed == []

    def test_flags_policy_with_missing_fixture(self, tree):
        _tmp, policies, arg_dir = tree
        (arg_dir / "compliant.tf").unlink()
        pairs, malformed = auto_test.discover_policies(policies)
        assert pairs == []
        assert len(malformed) == 1
        assert "compliant.tf" in malformed[0][1]

    def test_flags_fixtures_without_a_policy(self, tree):
        _tmp, policies, arg_dir = tree
        orphan = arg_dir.parent / "orphaned_argument"
        orphan.mkdir()
        (orphan / "compliant.tf").write_bytes(COMPLIANT_TF)
        (orphan / "nonCompliant.tf").write_bytes(NONCOMPLIANT_TF)
        pairs, malformed = auto_test.discover_policies(policies)
        assert len(pairs) == 1
        assert [d for d, _ in malformed] == [orphan]
        assert "policy.rego" in malformed[0][1]

    def test_ignores_helpers_tree(self, tree):
        _tmp, policies, _arg_dir = tree
        helpers = policies / "_helpers"
        helpers.mkdir()
        (helpers / "shared.rego").write_text("package terraform.helpers\n", encoding="utf-8")
        _pairs, malformed = auto_test.discover_policies(policies)
        assert malformed == []
