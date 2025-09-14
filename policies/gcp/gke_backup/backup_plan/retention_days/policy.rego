package terraform.gcp.security.gke_backup.backup_plan.retention_days

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup retention must be at least 30 days",
            "remedies": ["Set backup_retain_days to at least 30 days"]
        },
        {
            "condition": "Checking backup retention days",
            "attribute_path": ["retention_policy", 0, "backup_retain_days"],
            "values": [30, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details