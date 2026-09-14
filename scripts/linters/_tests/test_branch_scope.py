"""Unit tests for branch_scope.py.

These exercise the scope resolution and the per-path rule decision in isolation:
no git repo and no real policy tree are required (``resolve_scope`` is pointed at
a tiny docs tree built in ``tmp_path``, and the one test that covers the git
output parser feeds it a recorded ``git diff -z --name-status`` byte string).
"""

import shlex
import sys
from pathlib import Path

import pytest

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
# A committed plan's filename is the sha of the *.tf beside it; only the shape
# matters here, so any 64 hex characters will do.
SHA = "a" * 64



def test_adding_your_own_files_is_allowed():
    assert classify("A", "policies/gcp/Cloud Storage/google_storage_bucket/location.rego") is None
    assert classify("M", "docs/gcp/Cloud Storage/google_storage_bucket.json") is None


def test_committing_your_own_plan_is_allowed():
    plan = f"inputs/gcp/Cloud Storage/google_storage_bucket/location/{SHA}.json"
    assert classify("A", plan) is None
    assert classify("M", plan) is None


def test_deleting_your_own_stale_plan_is_allowed():
    # Editing a fixture changes its sha, and the harness prunes the plan of the
    # previous version as it writes the new one. That deletion is the contributor
    # doing the right thing.
    assert classify(
        "D", f"inputs/gcp/Cloud Storage/google_storage_bucket/location/{SHA}.json"
    ) is None


def test_deleting_someone_elses_plan_is_still_out_of_scope():
    assert classify(
        "D", f"inputs/gcp/Compute Engine/google_compute_image/family/{SHA}.json"
    ) == "deleted-file"


def test_reviving_the_legacy_plan_cache_is_its_own_finding():
    # One message about a stale layout, not a thousand out-of-scope files.
    assert classify("A", "inputs/plan_cache/gcp/abc123.json") == "legacy-plan-cache"
    assert classify("M", "inputs/plan_cache/gcp/abc123.json") == "legacy-plan-cache"


def test_deleting_the_legacy_plan_cache_is_allowed():
    assert classify("D", "inputs/plan_cache/gcp/abc123.json") is None


def test_deleting_your_own_file_is_still_a_deletion():
    assert classify(
        "D", "policies/gcp/Cloud Storage/google_storage_bucket/location.rego"
    ) == "deleted-file"


def test_a_non_plan_json_deletion_in_scope_is_still_a_deletion():
    assert classify(
        "D", "inputs/gcp/Cloud Storage/google_storage_bucket/location/plan.json"
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
        ("A", f"inputs/gcp/Cloud Storage/google_storage_bucket/location/{SHA}.json"),
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
        b"R096\0inputs/gcp/Cloud Storage/google_storage_bucket/location/aaa.json\0"
        b"inputs/gcp/Cloud Storage/google_storage_bucket/location/bbb.json\0"
    )
    monkeypatch.setattr(bs, "_git", lambda *args: recorded)
    monkeypatch.setattr(
        bs.subprocess, "run",
        lambda *a, **k: type("P", (), {"returncode": 0, "stdout": "deadbeef\n"})())

    assert bs.changed_entries("origin/dev") == [
        ("M", "docs/gcp/Cloud Storage/google_storage_bucket.json"),
        ("A", "inputs/gcp/Cloud Storage/google_storage_bucket/location/compliant.tf"),
        ("D", "policies/gcp/Cloud Storage/google_storage_bucket/old.rego"),
        ("D", "inputs/gcp/Cloud Storage/google_storage_bucket/location/aaa.json"),
        ("A", "inputs/gcp/Cloud Storage/google_storage_bucket/location/bbb.json"),
    ]


# --------------------------------------------------------------------------- #
# The recovery recipe
# --------------------------------------------------------------------------- #
# A per-rule remedy names one file because a rule is about one file. On the branch
# this was written for (2026-09-08, an old snapshot of the whole tree re-committed
# on top of a recent dev) that produced 2,737 findings and three example commands,
# and it read as "run this 2,737 times": the contributor ran the three, saw nothing
# change, and gave up. What is asserted here is not the wording but the two
# properties that made the report unusable — the recipe is built from the *whole*
# finding list rather than the truncated display list, and it never names the
# contributor's own resource kit, which `git checkout origin/dev -- .` would
# overwrite whenever that resource already has a version on dev.

SIBLING = "inputs/gcp/Cloud Storage/google_storage_hmac_key"
OWN = "inputs/gcp/Cloud Storage/google_storage_bucket"

# Three rule kinds spread over the shared trees, a sibling resource type and a
# resurrected plan cache — plus the contributor's own files, which are legitimate.
MIXED = [
    ("D", ".github/workflows/branch-scope.yml"),             # deleted-file
    ("M", "Guide/Policy_writing_tutorial/branch-scope.md"),  # out-of-scope-file
    ("M", "scripts/_tests/test_check_resource.py"),          # shared-harness-edit
    ("M", f"{SIBLING}/main.tf"),                             # out-of-scope-file
    ("D", f"{SIBLING}/variables.tf"),                        # deleted-file
    ("A", "inputs/plan_cache/gcp/old.json"),                 # legacy-plan-cache
    ("M", f"{OWN}/location/compliant.tf"),                   # in scope
    ("M", "docs/gcp/Cloud Storage/google_storage_bucket.json"),  # in scope
]


def _pathspec(line):
    """The paths a recipe command names, unquoted the way a shell would."""
    return shlex.split(line.split(" -- ", 1)[1])


def _commands(lines, name):
    return [line for line in lines if name in line]


def test_the_whole_mess_becomes_one_checkout_and_one_removal():
    findings = bs.check(MIXED, PLATFORM, FOLDER, RTYPE)
    recipe = bs.recovery_lines(findings, "origin/dev")

    checkouts = _commands(recipe, "git checkout")
    removals = _commands(recipe, "git rm")
    assert len(checkouts) == 1
    assert len(removals) == 1
    assert _pathspec(checkouts[0]) == [".github", "Guide", "scripts", SIBLING]
    assert _pathspec(removals[0]) == ["inputs/plan_cache"]


def test_the_recipe_never_names_the_branchs_own_resource():
    recipe = bs.recovery_lines(bs.check(MIXED, PLATFORM, FOLDER, RTYPE), "origin/dev")
    named = [p for line in recipe if " -- " in line for p in _pathspec(line)]

    assert not any(p == OWN or p.startswith(OWN + "/") for p in named)
    assert f"{RTYPE}.json" not in named
    # nor anything wide enough to swallow the branch's own kit on the way past
    assert not any(p in (".", "inputs", "docs", "policies") for p in named)


def test_the_recipe_ends_with_commit_and_push():
    recipe = bs.recovery_lines(bs.check(MIXED, PLATFORM, FOLDER, RTYPE), "origin/dev")
    assert _commands(recipe, "git status")
    assert _commands(recipe, 'git commit -m "Restore shared files from dev"')
    assert _commands(recipe, "git push")


def test_a_clean_branch_gets_no_recipe():
    assert bs.recovery_lines([], "origin/dev") == []


def test_the_recipe_covers_findings_the_listing_truncated_away(capsys):
    entries = MIXED + [("M", f"Guide/extra_{i}.md") for i in range(30)]
    bs._report(bs.check(entries, PLATFORM, FOLDER, RTYPE), max_per_rule=2,
               base="origin/dev")
    printed = capsys.readouterr().out

    assert "more file(s) with the same problem" in printed   # the listing truncated
    block = printed.split("How to fix all of the above", 1)[1]
    checkouts = _commands(block.splitlines(), "git checkout")
    assert len(checkouts) == 1
    assert "Guide" in _pathspec(checkouts[0])


@pytest.mark.parametrize("path,group", [
    (".github/workflows/branch-scope.yml", ".github"),
    (".gitattributes", ".gitattributes"),
    ("scripts/linters/branch_scope.py", "scripts"),
    (f"{SIBLING}/location/{SHA}.json", SIBLING),
    ("policies/gcp/Cloud Storage/google_storage_hmac_key/location.rego",
     "policies/gcp/Cloud Storage/google_storage_hmac_key"),
    ("docs/gcp/Compute Engine/google_compute_image.json",
     "docs/gcp/Compute Engine/google_compute_image.json"),
    ("inputs/plan_cache/gcp/Cloud Storage/old.json", "inputs/plan_cache"),
])
def test_a_path_is_named_at_the_width_that_is_safe(path, group):
    assert bs.recovery_group(path) == group


def test_a_directory_that_must_be_restored_is_not_also_removed_wholesale():
    # A sibling resource with a modified file and an added one: restoring the
    # directory and then `git rm -r` on it would delete what was just restored,
    # so the addition is named file by file instead.
    findings = bs.check([("M", f"{SIBLING}/main.tf"), ("A", f"{SIBLING}/new.tf")],
                        PLATFORM, FOLDER, RTYPE)
    assert bs.recovery_plan(findings) == ([SIBLING], [f"{SIBLING}/new.tf"])


def test_a_path_with_spaces_is_quoted_and_a_plain_one_is_not():
    assert bs._quote("scripts") == "scripts"
    assert bs._quote("inputs/gcp/Cloud Run (v2 API)/x") == (
        '"inputs/gcp/Cloud Run (v2 API)/x"')
