package terraform.gcp.security.security_posture.google_securityposture_posture.policy_sets_policies_constraint_org_policy_constraint_policy_rules_allow_all

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "allow_all is true, which permits every value and disables the constraint.",
            "remedies": ["Set allow_all to false so the constraint still applies."]
        },
        {
            "condition": "allow_all must be false",
            "attribute_path": ["policy_sets", 0, "policies", 0, "constraint", 0, "org_policy_constraint", 0, "policy_rules", 0, "allow_all"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
