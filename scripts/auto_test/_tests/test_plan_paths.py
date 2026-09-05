"""Where a fixture's committed plan lives, and how the harness keeps it correct.

The plan is `<sha>.json` inside the fixture directory. Three properties matter and
none of them is obvious from reading a single function:

* the path is derived from the fixture dir alone, so a tree under _tests/ resolves
  inside itself and a test can never write into the real repo;
* a plan left at the pre-move `inputs/plan_cache/<platform>/<sha>.json` path is
  adopted rather than re-planned, because a Service branch carries its own entries
  there through a merge of dev;
* every other .json in the directory is stale by construction and is removed.
"""

import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test


def _fixture(tmp_path, platform="gcp", service="Cloud Storage",
             resource="google_storage_bucket", argument="location"):
    """A fixture dir with one *.tf, at a real inputs/<platform>/... path."""
    d = tmp_path / "inputs" / platform / service / resource / argument
    d.mkdir(parents=True)
    (d / "compliant.tf").write_text('resource "google_storage_bucket" "a" {}\n')
    return d


def test_plan_lives_beside_the_fixture(tmp_path):
    d = _fixture(tmp_path)
    cache = auto_test.plan_cache_path(d)
    assert cache.parent == d
    assert cache.name == f"{auto_test.fixture_sha(d)}.json"
    assert auto_test.PLAN_FILE_RE.match(cache.name)


def test_the_sha_tracks_the_tf_contents(tmp_path):
    d = _fixture(tmp_path)
    before = auto_test.plan_cache_path(d)
    (d / "compliant.tf").write_text('resource "google_storage_bucket" "b" {}\n')
    assert auto_test.plan_cache_path(d) != before


def test_legacy_path_is_resolved_from_the_fixtures_own_tree(tmp_path):
    # Not from REPO_ROOT: a fixture tree under _tests/ must resolve inside itself.
    d = _fixture(tmp_path)
    legacy = auto_test.legacy_plan_path(d, "a" * 64)
    assert legacy == tmp_path / "inputs" / "plan_cache" / "gcp" / f"{'a' * 64}.json"


def test_legacy_path_is_none_outside_an_inputs_tree(tmp_path):
    d = tmp_path / "somewhere" / "else"
    d.mkdir(parents=True)
    assert auto_test.legacy_plan_path(d, "a" * 64) is None


def test_a_pre_move_plan_is_adopted_not_re_planned(tmp_path):
    d = _fixture(tmp_path)
    cache = auto_test.plan_cache_path(d)
    legacy = auto_test.legacy_plan_path(d, cache.stem)
    legacy.parent.mkdir(parents=True)
    legacy.write_text('{"planned_values": {}}')

    assert auto_test.adopt_legacy_plan(d, cache) is True
    assert cache.read_text() == '{"planned_values": {}}'
    assert not legacy.exists(), "the legacy file must be moved, not copied"


def test_adoption_never_overwrites_a_plan_already_in_place(tmp_path):
    d = _fixture(tmp_path)
    cache = auto_test.plan_cache_path(d)
    cache.write_text('{"current": true}')
    legacy = auto_test.legacy_plan_path(d, cache.stem)
    legacy.parent.mkdir(parents=True)
    legacy.write_text('{"stale": true}')

    assert auto_test.adopt_legacy_plan(d, cache) is False
    assert cache.read_text() == '{"current": true}'


def test_adoption_is_a_no_op_when_there_is_nothing_to_adopt(tmp_path):
    d = _fixture(tmp_path)
    assert auto_test.adopt_legacy_plan(d, auto_test.plan_cache_path(d)) is False


@pytest.mark.parametrize("stale", ["plan.json", f"{'b' * 64}.json"])
def test_pruning_removes_every_other_json(tmp_path, stale):
    d = _fixture(tmp_path)
    keep = auto_test.plan_cache_path(d)
    keep.write_text("{}")
    (d / stale).write_text("{}")

    assert auto_test.prune_stale_plans(d, keep=keep) == 1
    assert keep.exists()
    assert sorted(p.name for p in d.glob("*.json")) == [keep.name]


def test_pruning_leaves_the_tf_files_alone(tmp_path):
    d = _fixture(tmp_path)
    keep = auto_test.plan_cache_path(d)
    keep.write_text("{}")
    auto_test.prune_stale_plans(d, keep=keep)
    assert (d / "compliant.tf").exists()
