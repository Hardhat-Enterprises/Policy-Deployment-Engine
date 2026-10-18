package terraform.gcp.security.security_posture.google_securityposture_posture.policy_sets_policies_constraint_security_health_analytics_custom_module_config_severity

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "The module severity is left unspecified, so findings have no clear priority.",
            "remedies": ["Set severity to a real value such as LOW, MEDIUM, HIGH or CRITICAL."]
        },
        {
            "condition": "severity must not be unspecified",
            "attribute_path": ["policy_sets", 0, "policies", 0, "constraint", 0, "security_health_analytics_custom_module", 0, "config", 0, "severity"],
            "values": ["SEVERITY_UNSPECIFIED", ""],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
