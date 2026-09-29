package terraform.gcp.security.security_posture.google_securityposture_posture.policy_sets_policies_constraint_org_policy_constraint_custom_policy_rules_enforce

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "The custom org policy constraint is not enforced, so it does not apply.",
            "remedies": ["Set enforce to true so the custom constraint is applied."]
        },
        {
            "condition": "enforce must be true",
            "attribute_path": ["policy_sets", 0, "policies", 0, "constraint", 0, "org_policy_constraint_custom", 0, "policy_rules", 0, "enforce"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
