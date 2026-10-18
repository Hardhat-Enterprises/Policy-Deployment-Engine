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
# `auto_test.py` runs the extract -> analyze -> normalize pipeline and injects
# this key into the OPA input before evaluation. Any other evaluator must do the
# same, or every content security policy will report no findings and pass.
#
# The `values` argument (3rd param) is the severity THRESHOLD list: any finding
# at/above a threshold is a violation. e.g. ["MEDIUM"] fails on MEDIUM and HIGH.
#
# Tool-agnostic: only severity/confidence/rule_id are read, so this serves
# Bandit (Python) today and shellcheck/sqlfluff (script/query) later.

import data.terraform.helpers.shared

severity_order := {"LOW": 1, "MEDIUM": 2, "HIGH": 3, "CRITICAL": 4}

# The severities a content security threshold (`values`) may name, derived from
# severity_order so the two cannot drift. An unknown spelling is refused rather
# than silently ignored: the severity_order lookup would be undefined, and a
# typo'd threshold would otherwise make the policy pass everything.
valid_severities := object.keys(severity_order)

get_violations(tf_variables, attribute_path, thresholds) = results if {
    results := {
        _build_violation(tf_variables, attribute_path, thresholds, resource) |
        some resource in _get_resources(tf_variables.resource_type, attribute_path, thresholds)
    }
}

_get_resources(resource_type, attribute_path, thresholds) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        _has_finding_at_or_above(resource, attribute_path, thresholds)
    }
}

_has_finding_at_or_above(resource, attribute_path, thresholds) if {
    entry := input.content_security_findings[_]
    entry.resource_type == resource.type
    entry.resource_name == resource.name
    _path_matches(attribute_path, entry.attribute_path)
    finding := entry.findings[_]
    threshold := thresholds[_]
    severity_order[finding.severity] >= severity_order[threshold]
}

# A finding belongs to the policy's setting when its attribute_path matches the
# policy's, ignoring list indices: the policy names the setting
# "after_agent_callbacks.python_code" (with or without an index), and a finding
# recorded against any callback in that list matches it.
_path_matches(policy_path, finding_path) if {
    _setting(policy_path) == _setting(finding_path)
}

_setting(path) = segments if {
    segments := [seg | seg := path[_]; not is_number(seg)]
}

_build_violation(tf_variables, attribute_path, thresholds, resource) = violation if {
    name := shared.get_resource_attribute(resource, tf_variables.resource_value_name)
    violation := {
        "name": name,
        "message": sprintf(
            "%s '%s' has security findings %v in '%s'",
            [
                tf_variables.friendly_resource_name,
                name,
                _rule_ids(resource, attribute_path, thresholds),
                shared.format_attribute_path(attribute_path),
            ]
        ),
    }
}

# The rule IDs that actually failed: the setting the policy targets, at or above
# the policy's threshold. Below-threshold findings are deliberately left out, so
# the message lists exactly what made this resource non-compliant.
_rule_ids(resource, attribute_path, thresholds) = ids if {
    ids := [f.rule_id |
        entry := input.content_security_findings[_]
        entry.resource_type == resource.type
        entry.resource_name == resource.name
        _path_matches(attribute_path, entry.attribute_path)
        f := entry.findings[_]
        threshold := thresholds[_]
        severity_order[f.severity] >= severity_order[threshold]
    ]
}
