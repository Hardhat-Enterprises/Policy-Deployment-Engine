package terraform.gcp.security.apigee.google_apigee_developer_app.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer_app.vars
conditions := [
    [
        {
            "situation_description": "deletion_policy must be set to PREVENT to block destructive operations",
            "remedies": [
                "Set deletion_policy to PREVENT to block accidental or unauthorized deletion of the developer app and its consumer credentials via terraform destroy"
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
