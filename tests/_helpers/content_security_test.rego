package terraform.helpers.policies.content_security_test

# Content Security Policy Test Suite
#
# Tests the content_security policy module, which flags resources based on
# pre-computed static-analysis findings injected into the input under
# "content_security_findings".

import data.terraform.helpers.policies.content_security
import rego.v1

# A HIGH finding on the vulnerable resource only (secure resource has none).
high_finding_input := {
    "planned_values": {"root_module": {"resources": [
        {"type": "google_ces_agent", "name": "non_compliant_example_1",
         "values": {"display_name": "Non Compliant Example"}},
        {"type": "google_ces_agent", "name": "compliant_example_1",
         "values": {"display_name": "Compliant Example"}},
    ]}},
    "content_security_findings": [
        {"resource_type": "google_ces_agent", "resource_name": "non_compliant_example_1",
         "attribute_path": ["after_agent_callbacks", 0, "python_code"],
         "language": "python", "tool": "bandit",
         "findings": [
             {"severity": "HIGH", "confidence": "HIGH", "rule_id": "B602",
              "test_name": "subprocess_popen_with_shell_equals_true",
              "message": "subprocess call with shell=True", "line": 5},
         ]},
    ],
}

tf_variables := {
    "resource_type": "google_ces_agent",
    "friendly_resource_name": "CES Agent",
    "resource_value_name": "display_name",
}

test_high_finding_flagged_at_medium_threshold if {
    violations := content_security.get_violations(
        tf_variables, ["after_agent_callbacks", "python_code"], ["MEDIUM"]
    ) with input as high_finding_input

    count(violations) == 1
    some v in violations
    v.name == "Non Compliant Example"
    contains(v.message, "B602")
}

test_critical_threshold_ignores_high if {
    violations := content_security.get_violations(
        tf_variables, ["after_agent_callbacks", "python_code"], ["CRITICAL"]
    ) with input as high_finding_input

    count(violations) == 0
}

test_low_finding_not_flagged_at_medium_threshold if {
    low_input := {
        "planned_values": high_finding_input.planned_values,
        "content_security_findings": [
            {"resource_type": "google_ces_agent", "resource_name": "non_compliant_example_1",
             "attribute_path": ["after_agent_callbacks", 0, "python_code"],
             "language": "python", "tool": "bandit",
             "findings": [
                 {"severity": "LOW", "confidence": "HIGH", "rule_id": "B404",
                  "test_name": "blacklist", "message": "subprocess imported", "line": 1},
             ]},
        ],
    }
    violations := content_security.get_violations(
        tf_variables, ["after_agent_callbacks", "python_code"], ["MEDIUM"]
    ) with input as low_input

    count(violations) == 0
}

test_no_findings_not_flagged if {
    no_findings_input := {
        "planned_values": {"root_module": {"resources": [
            {"type": "google_ces_agent", "name": "compliant_example_1",
             "values": {"display_name": "Compliant Example"}},
        ]}},
        "content_security_findings": [],
    }
    violations := content_security.get_violations(
        tf_variables, ["after_agent_callbacks", "python_code"], ["MEDIUM"]
    ) with input as no_findings_input

    count(violations) == 0
}
