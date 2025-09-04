package terraform.gcp.security.gke_backup.backup_plan_iam_policy.groups
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "IAM policy uses individual user accounts instead of groups",
            "remedies": ["Use group-based access (group:) for better management"]
        },
        {
            "condition": "Prefer groups over individual users",
            "attribute_path": ["policy_data"],
            "values": ["group:"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details