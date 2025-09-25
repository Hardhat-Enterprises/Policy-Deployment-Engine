package terraform.gcp.security.gke_backup.backup_plan.mandatory_backup_scheduling

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must have a valid cron schedule configured",
        "remedies": ["Add backup_schedule with a valid cron_schedule expression"],
        "condition": "c1",
        "attribute_path": ["backup_schedule", 0, "paused"],
        "values": [false, null],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details