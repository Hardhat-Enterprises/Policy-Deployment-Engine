"""A policy whose declared resource type matches nothing in the plan must fail.

`validate_policy_output` decides a check by looking for the fixture's
non-compliant examples in the OPA output. The set of names it looks for comes
from `get_resource_name_map`, which filters the plan by the resource type the
policy declares in its `_vars.rego`. When that type is wrong — a missing
`google_` prefix, a dropped `_member` suffix — the filter matches nothing, so
there are no names to look for, nothing can be missing, and the check used to
report success. A policy pointed at a type that does not exist was therefore
indistinguishable from a policy where every example behaved correctly.

Every fixture is required to carry compliant and non-compliant examples of the
resource under test (the linter enforces the files, `fixture-one-sided` enforces
both sides), so an empty match set always means the policy or its `_vars` is
wrong, never that the fixture is legitimately empty.
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test


def _plan(tmp_path, resource_type="google_bigquery_datapolicy_data_policy_iam_member"):
    plan = tmp_path / "plan.json"
    plan.write_text(
        '{"planned_values": {"root_module": {"resources": ['
        f'{{"type": "{resource_type}", "name": "compliant_example_1", '
        '"values": {"data_policy_id": "compliant-example-1"}},'
        f'{{"type": "{resource_type}", "name": "non_compliant_example_1", '
        '"values": {"data_policy_id": "non-compliant-example-1"}}'
        "]}}}"
    )
    return plan


def test_a_type_that_matches_nothing_fails(tmp_path):
    # The messages describe a clean run: without the guard there is nothing to
    # match against and nothing missing, so this is exactly the shape that used
    # to pass while testing nothing.
    result = auto_test.validate_policy_output(
        "location", "bigquery_datapolicy_data_policy_iam", _plan(tmp_path),
        ["Total Data Policy detected: 0 ", "None - All passed"], False,
        "BigQuery Data Policy",
        "google_bigquery_datapolicy_data_policy_iam_member", "data_policy_id")

    assert result["passed"] is False


def test_the_failure_names_both_the_declared_and_the_actual_types(tmp_path):
    # A bare "failed" would leave the author guessing. The reason has to carry
    # the wrong type they wrote and the type the plan actually contains, which
    # together are the whole diagnosis.
    result = auto_test.validate_policy_output(
        "location", "bigquery_datapolicy_data_policy_iam", _plan(tmp_path),
        ["None - All passed"], False, "BigQuery Data Policy",
        "google_bigquery_datapolicy_data_policy_iam_member", "data_policy_id")

    reason = result["failure"]["reason"]
    assert "bigquery_datapolicy_data_policy_iam" in reason
    assert "google_bigquery_datapolicy_data_policy_iam_member" in reason


def test_the_correct_type_still_passes(tmp_path):
    # The guard must not fire on a working policy: with the right type declared,
    # the non-compliant example flagged and the compliant one left alone, the
    # check passes as before.
    result = auto_test.validate_policy_output(
        "location", "google_bigquery_datapolicy_data_policy_iam_member",
        _plan(tmp_path),
        ["Total Data Policy detected: 1 ",
         "['Situation 1: location is not approved', "
         "'Non-Compliant Resources: non-compliant-example-1']"],
        False, "BigQuery Data Policy",
        "google_bigquery_datapolicy_data_policy_iam_member", "data_policy_id")

    assert result["passed"] is True
