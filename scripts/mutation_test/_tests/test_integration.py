from pathlib import Path

import pytest

from scripts.mutation_test.resource_runner import (
    run_single_policy,
)


REPO_ROOT = Path(__file__).resolve().parents[3]


@pytest.mark.integration
def test_real_whitelist_policy_mutation_is_killed():
    policy_path = Path(
        "gcp/API Hub/"
        "google_apihub_curation/"
        "deletion_policy"
    )

    result = run_single_policy(
        REPO_ROOT,
        policy_path,
    )

    assert "error" not in result
    assert result.get("unsupported") is not True

    assert result["killed"] == 1
    assert result["survived"] == 0
    assert result["skipped"] == 0
    assert result["score"] == 100.0

    assert len(result["mutants"]) == 1

    mutant = result["mutants"][0]

    assert mutant["policy_type"] == "whitelist"
    assert mutant["status"] == "KILLED"
    assert mutant["original_value"] == "PREVENT"
    assert mutant["mutated_value"] == "DELETE"

    assert (
        "compliant_example_1"
        in mutant["new_failures"]
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