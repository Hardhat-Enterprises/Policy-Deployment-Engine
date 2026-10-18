package terraform.gcp.security.security_posture.google_securityposture_posture.policy_sets_policies_constraint_org_policy_constraint_policy_rules_enforce

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "The org policy constraint is not enforced, so any configuration is allowed and the control does nothing.",
            "remedies": ["Set enforce to true so the constraint is applied."]
        },
        {
            "condition": "enforce must not be false",
            "attribute_path": ["policy_sets", 0, "policies", 0, "constraint", 0, "org_policy_constraint", 0, "policy_rules", 0, "enforce"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
