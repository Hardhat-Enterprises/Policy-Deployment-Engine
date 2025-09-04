package terraform.gcp.security.gke_backup.backup_plan.retention_days
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup retention period is too short",
            "remedies": ["Set backup_retain_days to at least 7 days for adequate recovery window"]
        },
        {
            "condition": "Check minimum retention days",
            "attribute_path": ["retention_policy", "backup_retain_days"],  # No index needed
            "values": [7, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details