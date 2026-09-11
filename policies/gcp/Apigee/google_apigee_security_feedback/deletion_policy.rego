package terraform.gcp.security.apigee.google_apigee_security_feedback.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_security_feedback.vars
conditions := [
    [
        {
            "situation_description": "deletion_policy must be set to PREVENT to block destructive operations",
            "remedies": [
                "Set deletion_policy to PREVENT to block accidental or unauthorized deletion via terraform destroy"
            ]
        },
        {
            "condition": "check deletion_policy is set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
