"""Unit tests for branch_scope.py.

These exercise the scope resolution and the per-path rule decision in isolation:
no git repo and no real policy tree are required (``resolve_scope`` is pointed at
a tiny docs tree built in ``tmp_path``, and the one test that covers the git
output parser feeds it a recorded ``git diff -z --name-status`` byte string).
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.linters import branch_scope as bs

PLATFORM = "gcp"
FOLDER = "Cloud Storage"
RTYPE = "google_storage_bucket"


def classify(status, path, folder=FOLDER, rtype=RTYPE):
    return bs.classify(status, path, PLATFORM, folder, rtype)


# --------------------------------------------------------------------------- #
# parse_branch
# --------------------------------------------------------------------------- #
def test_parse_branch_reads_a_service_branch():
    assert bs.parse_branch("Service/gcp/cloud_storage/google_storage_bucket") == (
        "gcp", "cloud_storage", "google_storage_bucket")


def test_parse_branch_ignores_a_feature_branch():
    assert bs.parse_branch("feature/add-validator") is None


def test_parse_branch_ignores_dev():
    assert bs.parse_branch("dev") is None


def test_parse_branch_rejects_the_wrong_number_of_segments():
    assert bs.parse_branch("Service/gcp/cloud_storage") is None
    assert bs.parse_branch("Service/gcp/cloud_storage/google_storage_bucket/extra") is None


def test_parse_branch_rejects_an_empty_segment():
    assert bs.parse_branch("Service/gcp//google_storage_bucket") is None


# --------------------------------------------------------------------------- #
# resolve_scope — the branch slug is not the directory name
# --------------------------------------------------------------------------- #
def _docs_tree(tmp_path, *folders):
    for folder in folders:
        (tmp_path / "gcp" / folder).mkdir(parents=True)
    return str(tmp_path)


def test_resolve_scope_maps_a_slug_to_a_capitalised_folder(tmp_path):
    docs = _docs_tree(tmp_path, "Dataplex")
    assert bs.resolve_scope("gcp", "dataplex", docs) == "Dataplex"


def test_resolve_scope_maps_a_slug_across_spaces(tmp_path):
    docs = _docs_tree(tmp_path, "Cloud Storage")
    assert bs.resolve_scope("gcp", "cloud_storage", docs) == "Cloud Storage"


def test_resolve_scope_maps_a_slug_across_parentheses(tmp_path):
    # The real repo folder that motivates the slug scheme.
    docs = _docs_tree(tmp_path, "Access Context Manager (VPC Service Controls)")
    assert bs.resolve_scope(
        "gcp", "access_context_manager_vpc_service_controls", docs
    ) == "Access Context Manager (VPC Service Controls)"


def test_resolve_scope_maps_a_slug_across_a_hyphen(tmp_path):
    docs = _docs_tree(tmp_path, "Identity-Aware Proxy")
    assert bs.resolve_scope("gcp", "identity_aware_proxy", docs) == "Identity-Aware Proxy"


def test_resolve_scope_raises_for_an_unknown_slug(tmp_path):
    docs = _docs_tree(tmp_path, "Cloud Storage")
    try:
        bs.resolve_scope("gcp", "no_such_service", docs)
    except bs.ScopeError as exc:
        assert "check_branch_name.py" in str(exc)
    else:
        raise AssertionError("expected ScopeError")


# --------------------------------------------------------------------------- #
# path_in_scope
# --------------------------------------------------------------------------- #
def test_own_docs_json_is_in_scope():
    assert bs.path_in_scope(
        "docs/gcp/Cloud Storage/google_storage_bucket.json", PLATFORM, FOLDER, RTYPE)


def test_own_inputs_fixture_is_in_scope():
    assert bs.path_in_scope(
        "inputs/gcp/Cloud Storage/google_storage_bucket/location/compliant.tf",
        PLATFORM, FOLDER, RTYPE)


def test_own_policy_is_in_scope():
    assert bs.path_in_scope(
        "policies/gcp/Cloud Storage/google_storage_bucket/_vars.rego",
        PLATFORM, FOLDER, RTYPE)


def test_another_resource_in_the_same_service_is_out_of_scope():
    # The commonest real violation: two contributors in one service folder.
    assert not bs.path_in_scope(
        "docs/gcp/Cloud Storage/google_storage_bucket_iam_binding.json",
        PLATFORM, FOLDER, RTYPE)


def test_a_resource_whose_name_merely_starts_with_ours_is_out_of_scope():
    assert not bs.path_in_scope(
        "policies/gcp/Cloud Storage/google_storage_bucket_iam_binding/role.rego",
        PLATFORM, FOLDER, RTYPE)


def test_another_service_is_out_of_scope():
    assert not bs.path_in_scope(
        "docs/gcp/BigQuery/google_bigquery_table.json", PLATFORM, FOLDER, RTYPE)


def test_the_docs_folder_itself_is_matched_case_insensitively():
    # A miscapitalised directory is the structural linter's error to report,
    # not an out-of-scope one.
    assert bs.path_in_scope(
        "docs/gcp/cloud storage/google_storage_bucket.json", PLATFORM, FOLDER, RTYPE)


def test_a_docs_subdirectory_is_out_of_scope():
    # docs/<platform>/<folder>/<rtype>.json is exactly one file deep.
    assert not bs.path_in_scope(
        "docs/gcp/Cloud Storage/google_storage_bucket/notes.json",
        PLATFORM, FOLDER, RTYPE)


def test_a_bare_root_file_is_out_of_scope():
    assert not bs.path_in_scope("opa.exe", PLATFORM, FOLDER, RTYPE)


# --------------------------------------------------------------------------- #
# classify
# --------------------------------------------------------------------------- #
def test_adding_your_own_files_is_allowed():
    assert classify("A", "policies/gcp/Cloud Storage/google_storage_bucket/location.rego") is None
    assert classify("M", "docs/gcp/Cloud Storage/google_storage_bucket.json") is None


def test_adding_a_plan_cache_entry_is_allowed():
    assert classify("A", "inputs/plan_cache/gcp/abc123.json") is None


def test_deleting_a_plan_cache_entry_is_a_plan_cache_finding():
    # Reported as plan-cache-modified rather than deleted-file: a wiped cache is
    # one problem with one fix, not a thousand separate deletions.
    assert classify("D", "inputs/plan_cache/gcp/abc123.json") == "plan-cache-modified"


def test_modifying_a_plan_cache_entry_is_a_plan_cache_finding():
    assert classify("M", "inputs/plan_cache/gcp/abc123.json") == "plan-cache-modified"


def test_deleting_your_own_file_is_still_a_deletion():
    assert classify(
        "D", "policies/gcp/Cloud Storage/google_storage_bucket/location.rego"
    ) == "deleted-file"


def test_editing_the_harness_is_a_shared_harness_edit():
    assert classify("M", "scripts/auto_test/auto_test.py") == "shared-harness-edit"
    assert classify("M", "policies/_helpers/helpers.rego") == "shared-harness-edit"
    assert classify("M", "templates/gcp/policy.rego") == "shared-harness-edit"
    assert classify("M", "tests/_helpers/shared_test.rego") == "shared-harness-edit"


def test_editing_another_resource_is_out_of_scope():
    assert classify(
        "M", "docs/gcp/Compute Engine/google_compute_image.json"
    ) == "out-of-scope-file"


def test_editing_ci_is_out_of_scope():
    assert classify("M", ".github/workflows/policy_check_PR.yaml") == "out-of-scope-file"


def test_stray_junk_is_out_of_scope():
    for path in ("opa.exe", "r.png", "commits.txt", ".gitignore"):
        assert classify("A", path) == "out-of-scope-file", path


# --------------------------------------------------------------------------- #
# check
# --------------------------------------------------------------------------- #
def test_check_is_clean_for_an_honest_branch():
    entries = [
        ("M", "docs/gcp/Cloud Storage/google_storage_bucket.json"),
        ("A", "inputs/gcp/Cloud Storage/google_storage_bucket/location/compliant.tf"),
        ("A", "policies/gcp/Cloud Storage/google_storage_bucket/location.rego"),
        ("A", "inputs/plan_cache/gcp/abc123.json"),
    ]
    assert bs.check(entries, PLATFORM, FOLDER, RTYPE) == []


def test_check_reports_each_violation_once_sorted_by_rule_then_path():
    entries = [
        ("A", "opa.exe"),
        ("M", "scripts/auto_test/auto_test.py"),
        ("A", "policies/gcp/Cloud Storage/google_storage_bucket/location.rego"),
    ]
    findings = bs.check(entries, PLATFORM, FOLDER, RTYPE)
    assert [(f.rule, f.path) for f in findings] == [
        ("out-of-scope-file", "opa.exe"),
        ("shared-harness-edit", "scripts/auto_test/auto_test.py"),
    ]


def test_every_finding_carries_a_remedy_naming_the_file():
    entries = [("M", "docs/gcp/Compute Engine/google_compute_image.json")]
    finding = bs.check(entries, PLATFORM, FOLDER, RTYPE, base="dev")[0]
    assert "git checkout origin/dev" in finding.message
    assert "google_compute_image.json" in finding.message
    assert finding.severity == "error"


def test_every_rule_id_has_a_description_and_a_remedy():
    assert set(bs.RULES) == set(bs.REMEDIES)


# --------------------------------------------------------------------------- #
# changed_entries — git output parsing
# --------------------------------------------------------------------------- #
def test_changed_entries_parses_statuses_spaces_and_renames(monkeypatch):
    """A rename becomes a deletion of the old path plus an addition of the new.

    Paths are NUL-separated (``-z``), which is why service folders containing
    spaces survive intact.
    """
    recorded = (
        b"M\0docs/gcp/Cloud Storage/google_storage_bucket.json\0"
        b"A\0inputs/gcp/Cloud Storage/google_storage_bucket/location/compliant.tf\0"
        b"D\0policies/gcp/Cloud Storage/google_storage_bucket/old.rego\0"
        b"R096\0inputs/plan_cache/gcp/aaa.json\0inputs/plan_cache/gcp/bbb.json\0"
    )
    monkeypatch.setattr(bs, "_git", lambda *args: recorded)
    monkeypatch.setattr(
        bs.subprocess, "run",
        lambda *a, **k: type("P", (), {"returncode": 0, "stdout": "deadbeef\n"})())

    assert bs.changed_entries("origin/dev") == [
        ("M", "docs/gcp/Cloud Storage/google_storage_bucket.json"),
        ("A", "inputs/gcp/Cloud Storage/google_storage_bucket/location/compliant.tf"),
        ("D", "policies/gcp/Cloud Storage/google_storage_bucket/old.rego"),
        ("D", "inputs/plan_cache/gcp/aaa.json"),
        ("A", "inputs/plan_cache/gcp/bbb.json"),
    ]
