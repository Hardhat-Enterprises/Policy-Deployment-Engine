package terraform.gcp.security.gke_backup.backup_plan_iam_policy.service_accounts
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "IAM policy grants access to allUsers or allAuthenticatedUsers",
            "remedies": ["Use specific service accounts or user accounts instead of public access"]
        },
        {
            "condition": "Check for dangerous public access",
            "attribute_path": ["policy_data"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details