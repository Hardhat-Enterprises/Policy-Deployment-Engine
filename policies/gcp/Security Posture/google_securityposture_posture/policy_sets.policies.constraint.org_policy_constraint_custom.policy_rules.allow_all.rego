package terraform.gcp.security.security_posture.google_securityposture_posture.policy_sets_policies_constraint_org_policy_constraint_custom_policy_rules_allow_all

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "allow_all is true, which permits everything and disables the custom constraint.",
            "remedies": ["Set allow_all to false so the custom constraint still applies."]
        },
        {
            "condition": "allow_all must not be true",
            "attribute_path": ["policy_sets", 0, "policies", 0, "constraint", 0, "org_policy_constraint_custom", 0, "policy_rules", 0, "allow_all"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
