package terraform.gcp.security.gke_backup.backup_plan_iam_policy.roles
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "IAM policy contains overly permissive roles",
            "remedies": ["Use specific backup roles like roles/gkebackup.backupAdmin or roles/gkebackup.restoreAdmin"]
        },
        {
            "condition": "Check for overly permissive roles",
            "attribute_path": ["policy_data"],
            "values": ["roles/owner", "roles/editor"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details