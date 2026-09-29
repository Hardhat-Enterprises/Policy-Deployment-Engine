package terraform.gcp.security.security_posture.google_securityposture_posture.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.security_posture.google_securityposture_posture.vars

conditions := [
    [
        {
            "situation_description": "The posture does not block deletion. Terraform could destroy it by mistake.",
            "remedies": ["Set deletion_policy to PREVENT so the posture cannot be destroyed accidentally."]
        },
        {
            "condition": "deletion_policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
