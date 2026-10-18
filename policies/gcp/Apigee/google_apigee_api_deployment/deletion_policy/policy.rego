package terraform.gcp.security.apigee.google_apigee_api_deployment.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_deployment.vars
conditions := [
    [
        {
            "situation_description": "deletion_policy must be set to PREVENT to block destructive operations",
            "remedies": [
                "Set deletion_policy to PREVENT to block accidental or unauthorized resource deletion via terraform destroy"
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
