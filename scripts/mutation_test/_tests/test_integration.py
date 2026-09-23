from pathlib import Path

import pytest

from scripts.mutation_test.resource_runner import (
    run_single_policy,
)


REPO_ROOT = Path(__file__).resolve().parents[3]


REAL_POLICY_CASES = [
    (
        "gcp/API Hub/"
        "google_apihub_curation/"
        "deletion_policy",
        "whitelist",
        1,
    ),
    (
        "gcp/Access Context Manager (VPC Service Controls)/"
        "google_access_context_manager_access_level/"
        "basic.conditions.device_policy.os_constraints.os_type",
        "blacklist",
        1,
    ),
    (
        "gcp/Cloud (Stackdriver) Logging/"
        "google_logging_project_bucket_config/"
        "retention_days",
        "range",
        4,
    ),
    (
        "gcp/Apigee/"
        "google_apigee_environment/"
        "forward_proxy_uri",
        "pattern blacklist",
        1,
    ),
    (
        "gcp/Access Context Manager (VPC Service Controls)/"
        "google_access_context_manager_ingress_policy/"
        "resource",
        "pattern whitelist",
        1,
    ),
    (
        "gcp/Access Context Manager (VPC Service Controls)/"
        "google_access_context_manager_service_perimeter/"
        "status.restricted_services",
        "element blacklist",
        1,
    ),
    (
        "gcp/BigQuery Analytics Hub/"
        "google_bigquery_analytics_hub_listing/"
        "bigquery_dataset.replica_locations",
        "element pattern whitelist",
        1,
    ),
    (
        "gcp/Dialogflow CX/"
        "google_dialogflow_cx_webhook/"
        "generic_web_service.request_headers",
        "map key blacklist",
        1,
    ),
]


@pytest.mark.integration
@pytest.mark.parametrize(
    (
        "policy_string",
        "expected_policy_type",
        "expected_killed",
    ),
    REAL_POLICY_CASES,
)
def test_real_generated_mutations_are_killed(
    policy_string,
    expected_policy_type,
    expected_killed,
):
    result = run_single_policy(
        REPO_ROOT,
        Path(policy_string),
    )

    assert "error" not in result
    assert result.get("unsupported") is not True

    assert result["killed"] == expected_killed
    assert result["survived"] == 0
    assert result["skipped"] == 0
    assert result["score"] == 100.0

    assert result["mutants"]

    assert all(
        mutant["status"] == "KILLED"
        for mutant in result["mutants"]
    )

    assert all(
        mutant["policy_type"]
        == expected_policy_type
        for mutant in result["mutants"]
    )

    assert all(
        mutant.get("operator")
        for mutant in result["mutants"]
    )

    assert all(
        mutant["new_failures"]
        for mutant in result["mutants"]
    )


@pytest.mark.integration
def test_generated_whitelist_mutation_is_not_fixture_replay():
    policy_path = Path(
        "gcp/API Hub/"
        "google_apihub_curation/"
        "deletion_policy"
    )

    result = run_single_policy(
        REPO_ROOT,
        policy_path,
    )

    mutant = result["mutants"][0]

    assert mutant["original_value"] == "PREVENT"

    assert (
        mutant["mutated_value"]
        == "__PDE_MUTATION_OUTSIDE_ALLOWLIST__"
    )

    assert mutant["mutated_value"] != "DELETE"

    assert (
        mutant["operator"]
        == "whitelist-outside-allowlist"
    )


@pytest.mark.integration
def test_custom_policy_is_classified_as_unsupported():
    policy_path = Path(
        "gcp/API Hub/"
        "google_apihub_curation/"
        "endpoint.application_integration_endpoint_details.uri"
    )

    result = run_single_policy(
        REPO_ROOT,
        policy_path,
    )

    assert "error" not in result
    assert result["unsupported"] is True
    assert result["score"] is None

    assert (
        "standard PDE mutation metadata"
        in result["unsupported_reason"]
    )