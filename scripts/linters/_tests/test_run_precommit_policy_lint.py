"""Unit tests for the policy_lint wiring in run_precommit_linter.py.

These exercise the owned-triple derivation and the "fail only on findings the
contributor's own changes reached" filter in isolation, with a fake
``policy_lint.lint_resource`` (monkeypatched) — no git repo, no OPA, and no
real policy tree required.
"""

import re
import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.linters import policy_lint
from scripts.linters import run_precommit_linter as rpl

Finding = policy_lint.Finding


# --------------------------------------------------------------------------- #
# _owned_triples
# --------------------------------------------------------------------------- #
def test_owned_triples_from_a_policy_file():
    changed = {"policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"}
    assert rpl._owned_triples(changed) == {("gcp", "BigQuery", "google_bigquery_dataset")}


def test_owned_triples_from_an_input_fixture_file():
    changed = {"inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id/compliant.tf"}
    assert rpl._owned_triples(changed) == {("gcp", "BigQuery", "google_bigquery_dataset")}


def test_owned_triples_dedupes_across_multiple_files_in_the_same_resource():
    changed = {
        "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego",
        "policies/gcp/BigQuery/google_bigquery_dataset/_vars.rego",
        "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id/compliant.tf",
    }
    assert rpl._owned_triples(changed) == {("gcp", "BigQuery", "google_bigquery_dataset")}


def test_owned_triples_ignores_docs_and_shallow_paths():
    changed = {
        "docs/gcp/BigQuery/google_bigquery_dataset.json",
        "policies/gcp",             # too shallow: no resource type segment
        "README.md",
    }
    assert rpl._owned_triples(changed) == set()


def test_owned_triples_spans_multiple_resource_types():
    changed = {
        "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego",
        "policies/gcp/Cloud Storage/google_storage_bucket/location.rego",
    }
    assert rpl._owned_triples(changed) == {
        ("gcp", "BigQuery", "google_bigquery_dataset"),
        ("gcp", "Cloud Storage", "google_storage_bucket"),
    }


# --------------------------------------------------------------------------- #
# _finding_path / _finding_owned
# --------------------------------------------------------------------------- #
def test_finding_path_for_a_policy_finding():
    finding = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                       "hard-coded-value", "msg")
    path = rpl._finding_path("gcp", "BigQuery", "google_bigquery_dataset", finding)
    assert path == "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"


def test_finding_path_for_a_vars_finding():
    finding = Finding("BigQuery", "google_bigquery_dataset", "_vars",
                       "vars-resource-type", "msg")
    path = rpl._finding_path("gcp", "BigQuery", "google_bigquery_dataset", finding)
    assert path == "policies/gcp/BigQuery/google_bigquery_dataset/_vars.rego"


def test_finding_path_for_a_fixture_finding_is_the_argument_directory():
    finding = Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                       "fixture-drift", "msg")
    path = rpl._finding_path("gcp", "BigQuery", "google_bigquery_dataset", finding)
    assert path == "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id"


def test_finding_owned_when_the_exact_policy_file_changed():
    path = "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"
    assert rpl._finding_owned(path, {path})


def test_finding_owned_when_a_file_under_the_fixture_directory_changed():
    directory = "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id"
    changed = {f"{directory}/compliant.tf"}
    assert rpl._finding_owned(directory, changed)


def test_finding_not_owned_for_a_sibling_argument():
    # The contributor touched dataset_id.rego; a pre-existing error on a
    # different argument in the same resource type must not be attributed to
    # them.
    changed = {"policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"}
    other = "policies/gcp/BigQuery/google_bigquery_dataset/max_time_travel_hours.rego"
    assert not rpl._finding_owned(other, changed)


# --------------------------------------------------------------------------- #
# _policy_lint_findings — fake lint_resource, no OPA/git required
# --------------------------------------------------------------------------- #
def test_policy_lint_findings_keeps_only_owned_errors(monkeypatch):
    findings_by_triple = {
        ("gcp", "BigQuery", "google_bigquery_dataset"): [
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "hard-coded-value", "owned error"),
            Finding("BigQuery", "google_bigquery_dataset", "other_arg",
                    "hard-coded-value", "sibling, not owned"),
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "legacy-assign", "owned warning", severity="warn"),
        ],
    }

    def fake_lint_resource(root, platform, service, resource_type):
        return findings_by_triple[(platform, service, resource_type)]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    changed = {"policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"}
    triples = rpl._owned_triples(changed)

    owned, backlog = rpl._policy_lint_findings(triples, changed, root="/repo")

    assert [f.rule for _, f in owned] == ["hard-coded-value"]
    assert owned[0][0] == "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego"
    # The sibling-argument error is backlog; the warning is never counted at all.
    assert backlog == 1


def test_policy_lint_findings_covers_multiple_owned_triples(monkeypatch):
    findings_by_triple = {
        ("gcp", "BigQuery", "google_bigquery_dataset"): [
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "hard-coded-value", "e1"),
        ],
        ("gcp", "Cloud Storage", "google_storage_bucket"): [
            Finding("Cloud Storage", "google_storage_bucket", "location",
                    "hard-coded-value", "e2"),
        ],
    }

    def fake_lint_resource(root, platform, service, resource_type):
        return findings_by_triple[(platform, service, resource_type)]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    changed = {
        "policies/gcp/BigQuery/google_bigquery_dataset/dataset_id.rego",
        "policies/gcp/Cloud Storage/google_storage_bucket/location.rego",
    }
    triples = rpl._owned_triples(changed)

    owned, backlog = rpl._policy_lint_findings(triples, changed, root="/repo")

    assert {f.message for _, f in owned} == {"e1", "e2"}
    assert backlog == 0


def test_policy_lint_findings_owns_a_fixture_finding_via_the_argument_directory(monkeypatch):
    findings_by_triple = {
        ("gcp", "BigQuery", "google_bigquery_dataset"): [
            Finding("BigQuery", "google_bigquery_dataset", "dataset_id",
                    "fixture-drift", "compliant.tf and nonCompliant.tf also differ on: x"),
        ],
    }

    def fake_lint_resource(root, platform, service, resource_type):
        return findings_by_triple[(platform, service, resource_type)]

    monkeypatch.setattr(policy_lint, "lint_resource", fake_lint_resource)

    changed = {"inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id/compliant.tf"}
    triples = rpl._owned_triples(changed)

    owned, backlog = rpl._policy_lint_findings(triples, changed, root="/repo")

    assert len(owned) == 1
    assert owned[0][0] == "inputs/gcp/BigQuery/google_bigquery_dataset/dataset_id"
    assert backlog == 0


# --------------------------------------------------------------------------- #
# The rules page carries every rule id
# --------------------------------------------------------------------------- #
def test_every_rule_has_an_anchored_heading_in_the_rules_page():
    page = (project_root / "Guide" / "Policy_writing_tutorial" / "policy-lint.md").read_text(
        encoding="utf-8")
    headings = set(re.findall(r"^##\s+([a-z0-9-]+)\s*$", page, re.MULTILINE))
    missing = set(policy_lint.RULES) - headings
    assert not missing, f"policy-lint.md is missing headings for: {sorted(missing)}"
