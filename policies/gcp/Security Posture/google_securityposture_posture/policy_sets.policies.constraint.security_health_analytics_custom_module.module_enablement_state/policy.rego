package terraform.gcp.security.security_posture.google_securityposture_posture.policy_sets_policies_constraint_security_health_analytics_custom_module_module_enablement_state

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "The custom module is not enabled, so its detection does not run.",
            "remedies": ["Set module_enablement_state to ENABLED so the module runs."]
        },
        {
            "condition": "module must be enabled",
            "attribute_path": ["policy_sets", 0, "policies", 0, "constraint", 0, "security_health_analytics_custom_module", 0, "module_enablement_state"],
            "values": ["ENABLED"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
