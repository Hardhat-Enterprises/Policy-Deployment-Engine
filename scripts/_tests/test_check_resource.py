"""Unit tests for scripts/check_resource.py.

The subprocess steps (branch name, scope, lint, OPA) are covered by the tools they
shell out to and by CI running the whole thing. What is tested here is the logic
that only lives in this script: which branch it decides to check, what it considers
a complete document, what it considers covered, whether a fixture's plan is
committed, and — the point of the script — that every step reports something and
the exit code follows the failures.
"""

import json
import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts import check_resource as cr  # noqa: E402


# --------------------------------------------------------------------------- #
# Branch parsing
# --------------------------------------------------------------------------- #
def test_a_service_branch_names_one_resource():
    assert cr.parse_branch("Service/gcp/cloud_storage/google_storage_bucket") == (
        "gcp", "cloud_storage", "google_storage_bucket")


@pytest.mark.parametrize("branch", [
    "dev",
    "feature/some-work",
    "Service/gcp/cloud_storage",                              # too short
    "Service/gcp/cloud_storage/google_storage_bucket/extra",  # too long
])
def test_other_branches_name_no_resource(branch):
    assert cr.parse_branch(branch) is None


# --------------------------------------------------------------------------- #
# Doc completeness
# --------------------------------------------------------------------------- #
def _doc(**args):
    return {"arguments": args}


def test_a_complete_document_has_no_findings():
    doc = _doc(location={"security_impact": True, "rationale": "Constrains data residency."})
    assert cr.check_doc_completeness(doc) == []


def test_the_placeholder_string_is_not_a_real_boolean():
    # The tree-wide linter still tolerates "true/false"; the resource gate must not,
    # or an unassessed argument reaches dev looking assessed.
    doc = _doc(location={"security_impact": "true/false", "rationale": "words"})
    findings = cr.check_doc_completeness(doc)
    assert len(findings) == 1
    assert "security_impact" in findings[0]


@pytest.mark.parametrize("rationale", ["", "   ", None])
def test_an_empty_rationale_is_a_finding(rationale):
    doc = _doc(location={"security_impact": False, "rationale": rationale})
    assert any("rationale" in f for f in cr.check_doc_completeness(doc))


def test_block_arguments_are_not_assessed():
    # A block has no security_impact of its own; only its leaves do.
    doc = _doc(settings={"type": "block", "description": "d", "required": False})
    assert list(cr.leaf_args(doc)) == []
    assert cr.check_doc_completeness(doc) == []


# --------------------------------------------------------------------------- #
# True-arg coverage
# --------------------------------------------------------------------------- #
def _resource_tree(tmp_path, *, policy=None, fixture=None):
    """A repo-shaped tree, optionally with a policy file and/or a fixture dir."""
    if policy:
        p = tmp_path / "policies" / "gcp" / "Cloud Storage" / "google_storage_bucket"
        p.mkdir(parents=True, exist_ok=True)
        (p / policy).write_text("package x\n")
    if fixture:
        f = tmp_path / "inputs" / "gcp" / "Cloud Storage" / "google_storage_bucket" / fixture
        f.mkdir(parents=True, exist_ok=True)
    return tmp_path


def test_a_covered_true_argument_passes(tmp_path, monkeypatch):
    _resource_tree(tmp_path, policy="location.rego", fixture="location")
    monkeypatch.chdir(tmp_path)
    doc = _doc(location={"security_impact": True, "rationale": "r"})
    assert cr.check_true_arg_coverage(doc, "gcp", "Cloud Storage", "google_storage_bucket") == []


def test_a_true_argument_missing_both_reports_both(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)
    doc = _doc(location={"security_impact": True, "rationale": "r"})
    findings = cr.check_true_arg_coverage(doc, "gcp", "Cloud Storage", "google_storage_bucket")
    assert len(findings) == 2
    assert any("missing policy" in f for f in findings)
    assert any("missing input fixture" in f for f in findings)


def test_a_false_argument_needs_no_policy_or_fixture(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)
    doc = _doc(labels={"security_impact": False, "rationale": "Metadata only."})
    assert cr.check_true_arg_coverage(doc, "gcp", "Cloud Storage", "google_storage_bucket") == []


# --------------------------------------------------------------------------- #
# --if-cached: is every plan committed?
# --------------------------------------------------------------------------- #
def _fixture_dir(tmp_path, argument="location"):
    d = (tmp_path / "inputs" / "gcp" / "Cloud Storage" / "google_storage_bucket" / argument)
    d.mkdir(parents=True)
    (d / "compliant.tf").write_text('resource "google_storage_bucket" "a" {}\n')
    return d


def test_a_fixture_without_its_plan_is_uncached(tmp_path, monkeypatch):
    _fixture_dir(tmp_path)
    monkeypatch.setattr(cr, "REPO", tmp_path)
    missing = cr.uncached_fixtures(Path("inputs/gcp/Cloud Storage/google_storage_bucket"))
    assert [d.name for d in missing] == ["location"]


def test_a_fixture_with_its_plan_is_cached(tmp_path, monkeypatch):
    d = _fixture_dir(tmp_path)
    cr.plan_cache_path(d).write_text("{}")
    monkeypatch.setattr(cr, "REPO", tmp_path)
    assert cr.uncached_fixtures(Path("inputs/gcp/Cloud Storage/google_storage_bucket")) == []


def test_a_stale_plan_does_not_count_as_cached(tmp_path, monkeypatch):
    # The name is the validity check: a plan for the previous *.tf is not this
    # fixture's plan, and terraform would still have to run.
    d = _fixture_dir(tmp_path)
    (d / f"{'a' * 64}.json").write_text("{}")
    monkeypatch.setattr(cr, "REPO", tmp_path)
    assert len(cr.uncached_fixtures(Path("inputs/gcp/Cloud Storage/google_storage_bucket"))) == 1


def test_a_missing_directory_is_not_an_error(tmp_path, monkeypatch):
    monkeypatch.setattr(cr, "REPO", tmp_path)
    assert cr.uncached_fixtures(Path("inputs/gcp/nope/nope")) == []


# --------------------------------------------------------------------------- #
# --changed-only: does this commit touch anything the gate reads?
# --------------------------------------------------------------------------- #
ARGS = ("gcp", "Cloud Storage", "google_storage_bucket")


@pytest.mark.parametrize("path", [
    "docs/gcp/Cloud Storage/google_storage_bucket.json",
    "inputs/gcp/Cloud Storage/google_storage_bucket/location/compliant.tf",
    "policies/gcp/Cloud Storage/google_storage_bucket/location.rego",
    "policies/gcp/Cloud Storage/google_storage_bucket/_vars.rego",
])
def test_the_resources_own_files_are_recognised(path):
    assert cr.touches_resource([path], *ARGS) == [path]


@pytest.mark.parametrize("path", [
    "docs/gcp/Cloud Storage/google_storage_bucket_iam_binding.json",   # neighbouring resource
    "inputs/gcp/Compute Engine/google_compute_image/family/compliant.tf",
    "policies/_helpers/helpers.rego",
    "README.md",
    "scripts/auto_test/auto_test.py",
])
def test_everything_else_is_not_this_resource(path):
    assert cr.touches_resource([path], *ARGS) == []


def test_a_service_folder_with_spaces_survives_the_prefix_match():
    # Folder names carry spaces and brackets; the match is a plain string compare
    # on repo-relative paths, so nothing needs escaping — but it is worth pinning.
    path = "inputs/gcp/Cloud Run (v2 API)/google_cloud_run_v2_service/ingress/compliant.tf"
    assert cr.touches_resource([path], "gcp", "Cloud Run (v2 API)",
                               "google_cloud_run_v2_service") == [path]


@pytest.mark.parametrize("path,reads", [
    ("inputs/gcp/S/r/a/compliant.tf", True),
    ("policies/gcp/S/r/a.rego", True),
    ("docs/gcp/S/r.json", False),
])
def test_only_tf_and_rego_feed_the_opa_test(path, reads):
    # A docs edit moves completeness and coverage; it cannot move a terraform plan
    # or an OPA verdict, so the expensive step is skippable while the cheap ones run.
    assert cr.touches_opa_inputs([path]) is reads


# --------------------------------------------------------------------------- #
# Reporting
# --------------------------------------------------------------------------- #
def test_a_clean_report_exits_zero(capsys):
    report = cr.Report()
    report.ok("Branch name", "fine")
    assert report.summarise("google_storage_bucket") == 0
    assert "every check passed" in capsys.readouterr().out


def test_a_failing_report_exits_one_and_names_the_step(capsys):
    report = cr.Report()
    report.ok("Branch name")
    report.fail("OPA test", "did not pass")
    assert report.summarise("google_storage_bucket") == 1
    out = capsys.readouterr().out
    assert "OPA test" in out
    assert "CI runs the same checks" in out


def test_skips_are_counted_but_do_not_fail(capsys):
    report = cr.Report()
    report.ok("Lint")
    report.skip("OPA test", "no committed plan")
    assert report.summarise("google_storage_bucket") == 0
    assert "1 skipped" in capsys.readouterr().out


def test_every_step_prints_something(capsys):
    # A step that reports nothing is indistinguishable from one that never ran —
    # the exact confusion this script exists to remove.
    report = cr.Report()
    report.ok("Branch name")
    report.skip("Branch scope", "no origin/dev")
    report.fail("Lint", "findings")
    lines = [line for line in capsys.readouterr().out.splitlines() if line.strip()]
    assert len(lines) == 3
    assert all(any(m in line for m in ("[OK]", "[skip]", "[FAIL]")) for line in lines)


# --------------------------------------------------------------------------- #
# Entry point
# --------------------------------------------------------------------------- #
def test_a_non_service_branch_skips_the_gate_and_passes(capsys):
    assert cr.main(["--branch", "feature/tooling", "--gate-only"]) == 0
    assert "no single resource to check" in capsys.readouterr().out


def test_an_unknown_service_slug_fails(capsys):
    assert cr.main(["--branch", "Service/gcp/not_a_service/google_x", "--gate-only"]) == 1
    assert "does not match any docs/gcp service" in capsys.readouterr().out


def test_a_service_branch_with_no_doc_fails(capsys):
    assert cr.main(["--branch", "Service/gcp/cloud_storage/google_not_a_resource",
                    "--gate-only"]) == 1
    assert "resource doc not found" in capsys.readouterr().out


def test_the_real_repo_passes_its_own_gate(capsys):
    # An end-to-end check against a resource that is green on dev, so a regression
    # in the wiring (paths, slug resolution, auto_test invocation) fails here rather
    # than on a contributor's branch.
    assert cr.main(["--branch", "Service/gcp/api_hub/google_apihub_plugin", "--gate-only"]) == 0
    out = capsys.readouterr().out
    assert "Doc completeness" in out and "True-arg coverage" in out and "OPA test" in out
