package terraform.helpers.policies.content_security

# Content Security policy.
#
# Decides whether a Terraform resource violates policy based on PRE-COMPUTED
# static-analysis findings (e.g. Bandit). Findings are injected into the OPA
# input under the top-level key "content_security_findings":
#
#   [
#     {
#       "resource_type": "google_ces_agent",
#       "resource_name": "non_compliant_example_1",
#       "attribute_path": ["after_agent_callbacks", 0, "python_code"],
#       "language": "python",
#       "tool": "bandit",
#       "findings": [
#         {"severity": "HIGH", "confidence": "HIGH", "rule_id": "B602", "message": "..."}
#       ]
#     }
#   ]
#
# The `values` argument (3rd param) is the severity THRESHOLD list: any finding
# at/above a threshold is a violation. e.g. ["MEDIUM"] fails on MEDIUM and HIGH.
#
# Tool-agnostic: only severity/confidence/rule_id are read, so this serves
# Bandit (Python) today and shellcheck/sqlfluff (script/query) later.

import data.terraform.helpers.shared

severity_order := {"LOW": 1, "MEDIUM": 2, "HIGH": 3, "CRITICAL": 4}

get_violations(tf_variables, attribute_path, thresholds) = results if {
    results := {
        _build_violation(tf_variables, attribute_path, resource) |
        some resource in _get_resources(tf_variables.resource_type, thresholds)
    }
}

_get_resources(resource_type, thresholds) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        _has_finding_at_or_above(resource, thresholds)
    }
}

_has_finding_at_or_above(resource, thresholds) if {
    entry := input.content_security_findings[_]
    entry.resource_type == resource.type
    entry.resource_name == resource.name
    finding := entry.findings[_]
    threshold := thresholds[_]
    severity_order[finding.severity] >= severity_order[threshold]
}

_build_violation(tf_variables, attribute_path, resource) = violation if {
    name := shared.get_resource_attribute(resource, tf_variables.resource_value_name)
    violation := {
        "name": name,
        "message": sprintf(
            "%s '%s' has security findings %v in '%s'",
            [
                tf_variables.friendly_resource_name,
                name,
                _rule_ids(resource),
                shared.format_attribute_path(attribute_path),
            ]
        ),
    }
}

_rule_ids(resource) = ids if {
    ids := [f.rule_id |
        entry := input.content_security_findings[_]
        entry.resource_name == resource.name
        f := entry.findings[_]
    ]
}
