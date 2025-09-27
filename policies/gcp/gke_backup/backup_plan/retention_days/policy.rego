package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.retention_days

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup retention period is too short for compliance",
            "remedies": ["Increase backup_retain_days to at least 7 days", "Consider regulatory requirements"]
        },
        {
            "condition": "c1: retention period must be at least 7 days",
            "attribute_path": ["retention_policy", 0, "backup_retain_days"],
            "values": [7, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details