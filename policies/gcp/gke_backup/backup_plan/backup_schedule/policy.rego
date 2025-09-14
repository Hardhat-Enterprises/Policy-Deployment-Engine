package terraform.gcp.security.gke_backup.backup_plan.backup_schedule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup plan must have a scheduled backup",
            "remedies": ["Add backup_schedule with cron_schedule"]
        },
        {
            "condition": "Checking backup schedule is configured",
            "attribute_path": ["backup_schedule"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details