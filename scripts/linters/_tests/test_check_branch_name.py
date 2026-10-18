"""Unit tests for check_branch_name.py.

``validate_branch_name`` is called directly with a docs root, so no git repo is
needed; the Service cases point at a tiny docs tree built in ``tmp_path``.
"""

import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.linters import check_branch_name as cbn


@pytest.fixture
def docs_root(tmp_path):
    """A docs tree with one documented resource."""
    folder = tmp_path / "gcp" / "Cloud Run (v2 API)"
    folder.mkdir(parents=True)
    (folder / "google_cloud_run_v2_service.json").write_text("{}")
    return str(tmp_path)


@pytest.mark.parametrize("branch", [
    "Task/element_pattern_whitelist",
    "Task/harden_ci_unpinned_actions",
    "Task/tamim1517/cross_platform_provider_cache_setup",
    "Task/stokF/add_topic_categories_to_the_contributor_s_quiz",
])
def test_task_branches_are_allowed(branch, docs_root):
    assert cbn.validate_branch_name(branch, docs_root) == (True, None)


@pytest.mark.parametrize("branch", [
    "Task/",           # nothing after the prefix
    "Task/x",          # a single character is too short
    "Task/_leading",   # first character must be alphanumeric
    "task/lowercase_prefix",
    "Tasks/other_prefix",
])
def test_near_miss_task_branches_are_rejected(branch, docs_root):
    is_valid, error = cbn.validate_branch_name(branch, docs_root)
    assert not is_valid
    assert branch in error


def test_feature_branches_still_pass(docs_root):
    assert cbn.validate_branch_name("feature/add-validator", docs_root) == (True, None)


def test_service_branches_still_pass(docs_root):
    branch = "Service/gcp/cloud_run_v2_api/google_cloud_run_v2_service"
    assert cbn.validate_branch_name(branch, docs_root) == (True, None)


def test_unknown_prefix_is_still_rejected(docs_root):
    is_valid, error = cbn.validate_branch_name("chore/x", docs_root)
    assert not is_valid
    assert "Task/<topic_slug>" in error
