"""Where a fixture's committed plan lives, and how the harness keeps it correct.

The plan is `<sha>.json` inside the fixture directory. Three properties matter and
none of them is obvious from reading a single function:

* the path is derived from the fixture dir alone, so a tree under _tests/ resolves
  inside itself and a test can never write into the real repo;
* shared configuration participates in the hash and local configuration overrides it;
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
    d = tmp_path / "policies" / platform / service / resource / argument
    d.mkdir(parents=True)
    (d / "config.tf").write_bytes(b"# test config")
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


def test_explicit_root_does_not_escape_into_another_checkout(tmp_path):
    d = _fixture(tmp_path)
    assert auto_test.plan_cache_path(d, tmp_path).parent == d
    with pytest.raises(ValueError):
        auto_test.plan_cache_path(d, tmp_path / "unrelated")


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


# --------------------------------------------------------------------------- #
# Line endings
#
# The fixture sha must not depend on how the contributor's git checked the *.tf
# out. It used to: a Windows default (core.autocrlf=true) gave CRLF in the working
# tree, a sha nobody on an LF checkout could reproduce, and — because the plan is
# found by name — `fixture-missing-plan` against every argument of the resource in
# CI and on the portal, while the same fixture passed locally.
# --------------------------------------------------------------------------- #
def _twins(tmp_path, body='resource "google_storage_bucket" "a" {\n  x = 1\n}\n'):
    """The same fixture written LF and CRLF, in two separate trees."""
    lf = _fixture(tmp_path / "lf")
    crlf = _fixture(tmp_path / "crlf")
    (lf / "compliant.tf").write_bytes(body.encode())
    (crlf / "compliant.tf").write_bytes(body.encode().replace(b"\n", b"\r\n"))
    return lf, crlf


def test_a_crlf_fixture_hashes_the_same_as_its_lf_twin(tmp_path):
    lf, crlf = _twins(tmp_path)
    assert (crlf / "compliant.tf").read_bytes() != (lf / "compliant.tf").read_bytes(), \
        "the twins must actually differ in bytes or this proves nothing"
    assert auto_test.fixture_sha(crlf) == auto_test.fixture_sha(lf)
    assert auto_test.plan_cache_path(crlf).name == auto_test.plan_cache_path(lf).name


def test_lf_is_the_canonical_form(tmp_path):
    # dev and CI are all-LF, so their existing <sha>.json names must not move.
    lf, _ = _twins(tmp_path)
    raw = auto_test.canonical_text_bytes((lf / "compliant.tf").read_bytes())
    assert raw == (lf / "compliant.tf").read_bytes()


def test_a_utf8_bom_does_not_change_the_sha(tmp_path):
    lf, bom = _twins(tmp_path)
    tf = bom / "compliant.tf"
    tf.write_bytes(auto_test.UTF8_BOM + tf.read_bytes())
    assert auto_test.fixture_sha(bom) == auto_test.fixture_sha(lf)


def test_a_lone_cr_normalises_too(tmp_path):
    lf, cr = _twins(tmp_path)
    tf = cr / "compliant.tf"
    tf.write_bytes(tf.read_bytes().replace(b"\r\n", b"\r"))
    assert auto_test.fixture_sha(cr) == auto_test.fixture_sha(lf)


def test_the_sha_still_tracks_content_through_normalisation(tmp_path):
    # Normalising must not flatten real edits into one sha.
    a = _fixture(tmp_path / "a")
    b = _fixture(tmp_path / "b")
    (a / "compliant.tf").write_bytes(b"x = 1\r\n")
    (b / "compliant.tf").write_bytes(b"x = 2\r\n")
    assert auto_test.fixture_sha(a) != auto_test.fixture_sha(b)


def test_a_crlf_working_tree_finds_its_own_old_plan(tmp_path):
    # The contributor's own machine: the *.tf are still CRLF on disk, and the plan
    # is named for those raw bytes.
    d = _fixture(tmp_path)
    (d / "compliant.tf").write_bytes(b'resource "google_storage_bucket" "a" {\r\n}\r\n')
    cache = auto_test.plan_cache_path(d)
    old = d / f"{auto_test._sha_over(d, lambda b: b)}.json"
    assert old != cache, "a CRLF fixture must hash differently before normalisation"
    old.write_text('{"planned_values": {}}')

    assert auto_test.adopt_denormalised_plan(d, cache) is True
    assert cache.read_text() == '{"planned_values": {}}'
    assert not old.exists(), "the plan must be moved, not copied"


def test_an_lf_checkout_finds_a_plan_committed_from_a_crlf_tree(tmp_path):
    # The case CI and the portal actually see. git stored the *.tf as LF, so the
    # CRLF bytes the plan was named for exist nowhere in the repo; only projecting
    # the fixture forward to CRLF recovers the name. This is what lets an affected
    # branch be repaired from any checkout instead of by the contributor who made it.
    d = _fixture(tmp_path)
    (d / "compliant.tf").write_bytes(b'resource "google_storage_bucket" "a" {\n}\n')
    cache = auto_test.plan_cache_path(d)
    windows_name = d / f"{auto_test._sha_over(d, auto_test._to_crlf)}.json"
    assert windows_name != cache
    windows_name.write_text('{"planned_values": {}}')

    assert auto_test.adopt_denormalised_plan(d, cache) is True
    assert cache.read_text() == '{"planned_values": {}}'
    assert not windows_name.exists()


def test_an_all_lf_fixture_still_offers_the_crlf_projection(tmp_path):
    # Its own bytes are already canonical, so the only alternate name worth probing
    # is the one a Windows working tree would have produced for it.
    d = _fixture(tmp_path)
    (d / "compliant.tf").write_bytes(b"x = 1\n")
    alts = auto_test.alternate_fixture_shas(d)
    assert alts == [auto_test._sha_over(d, auto_test._to_crlf)]
    assert auto_test.fixture_sha(d) not in alts


def test_a_fixture_with_no_line_endings_has_no_alternates(tmp_path):
    # Nothing to respell: every transform lands on the same bytes.
    d = _fixture(tmp_path)
    (d / "compliant.tf").write_bytes(b"x = 1")
    assert auto_test.alternate_fixture_shas(d) == []


def test_a_fixture_with_line_endings_has_both_alternates(tmp_path):
    d = _fixture(tmp_path)
    (d / "compliant.tf").write_bytes(b"x = 1\r\n")
    alts = auto_test.alternate_fixture_shas(d)
    # raw (already CRLF) and the CRLF projection coincide here — deduplicated.
    assert len(alts) == 1
    assert auto_test.fixture_sha(d) not in alts


def test_a_stale_plan_is_never_adopted(tmp_path):
    # The property the sha naming exists for: a fixture edited without re-running
    # the harness is caught, not silently tested against the plan of its old config.
    # A stale plan is a lone <64-hex>.json holding a real plan, exactly like the
    # CRLF case — only the sha tells them apart.
    d = _fixture(tmp_path)
    stale = auto_test.plan_cache_path(d)
    stale.write_text('{"planned_values": {"root_module": {"resources": []}}}')
    (d / "compliant.tf").write_text('resource "google_storage_bucket" "edited" {}\n')
    cache = auto_test.plan_cache_path(d)
    assert stale != cache

    assert auto_test.adopt_denormalised_plan(d, cache) is False
    assert not cache.exists()
    assert stale.exists()


def test_crlf_adoption_never_overwrites_a_plan_already_in_place(tmp_path):
    d = _fixture(tmp_path)
    (d / "compliant.tf").write_bytes(b"x = 1\r\n")
    cache = auto_test.plan_cache_path(d)
    cache.write_text('{"current": true}')
    for sha in auto_test.alternate_fixture_shas(d):
        (d / f"{sha}.json").write_text('{"old": true}')

    assert auto_test.adopt_denormalised_plan(d, cache) is False
    assert cache.read_text() == '{"current": true}'


def test_adoption_is_a_no_op_on_an_all_lf_fixture(tmp_path):
    # The two shas coincide, so there is nothing to rename and no self-move.
    d = _fixture(tmp_path)
    assert auto_test.adopt_denormalised_plan(d, auto_test.plan_cache_path(d)) is False
