"""An unrecognised policy_type must fail the check loudly, naming the bad type.

`policies/_helpers/helpers.rego` dispatches exactly six policy types. A policy
naming a seventh used to build an error object and then throw it away, so the
policy evaluated to "None - All passed" and the check went green whenever some
*other* condition in the file happened to flag the fixture. The helper now
refuses the whole summary and emits a POLICY ERROR message instead; these tests
cover the auto_test half of that contract.
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_test import auto_test


ERROR_MESSAGE = (
    "POLICY ERROR: unknown policy_type 'pattern_whitelist'. Nothing in this policy "
    "was checked. Valid values are: blacklist, whitelist, range, pattern blacklist, "
    "pattern whitelist, element blacklist. Edit the \"policy_type\" in this policy's "
    "conditions to one of those - they are lowercase and use a SPACE, not an "
    "underscore (\"pattern whitelist\", not \"pattern_whitelist\") - then run the "
    "test again."
)


def test_find_policy_error_returns_none_for_an_ordinary_summary():
    messages = [
        "Total Storage Bucket detected: 2 ",
        "['Situation 1: force_destroy is enabled', "
        "'Non-Compliant Resources: non_compliant_example_1']",
    ]
    assert auto_test.find_policy_error(messages) is None


def test_find_policy_error_reads_the_marker_out_of_a_stringified_list():
    # OPA returns `message` as a nested array; normalize_messages stringifies it,
    # so the marker can sit inside a Python repr rather than at position 0.
    assert auto_test.find_policy_error([f"['{ERROR_MESSAGE}']"]) == ERROR_MESSAGE


def test_validate_policy_output_fails_with_the_helper_text_as_the_reason(tmp_path):
    # The plan is never read: the error is detected before any name matching, so a
    # policy the engine refused to evaluate cannot be rescued by the fixture's shape.
    result = auto_test.validate_policy_output(
        "location", "google_storage_bucket", tmp_path / "no-such-plan.json",
        [ERROR_MESSAGE], False, "Cloud Storage", "google_storage_bucket")

    assert result["passed"] is False
    assert result["failure"]["reason"] == ERROR_MESSAGE
    assert "pattern_whitelist" in result["failure"]["reason"]


def test_a_bogus_type_fails_even_when_the_fixture_has_no_non_compliant_example(tmp_path):
    # The regression this guards: name matching alone would report "nothing missing"
    # for an all-compliant fixture, so the check would go GREEN on a policy that was
    # never evaluated. The marker check runs first and is independent of the plan.
    plan = tmp_path / "plan.json"
    plan.write_text('{"planned_values": {"root_module": {"resources": ['
                    '{"type": "google_storage_bucket", "values": '
                    '{"name": "compliant_example_1"}}]}}}')

    result = auto_test.validate_policy_output(
        "location", "google_storage_bucket", plan, [ERROR_MESSAGE], False,
        "Cloud Storage", "google_storage_bucket", "name")

    assert result["passed"] is False
    assert "unknown policy_type" in result["failure"]["reason"]
