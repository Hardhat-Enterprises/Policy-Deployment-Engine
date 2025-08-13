package terraform.gcp.security.gke_backup.backup_plan.backup_schedule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "Backup schedule is not configured",
        "remedies": ["Configure backup_schedule with a cron expression for regular backups"],
        "conditions": [
            {
                "condition": "c1: backup schedule is empty",
                "attribute_path": ["backup_schedule", 0, "cron_schedule"],
                "values": ["", null],
                "policy_type": "blacklist"
            }
        ]
    }
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details