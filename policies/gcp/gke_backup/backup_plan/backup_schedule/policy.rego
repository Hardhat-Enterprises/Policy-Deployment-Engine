package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.backup_schedule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup schedule is paused or disabled",
            "remedies": ["Ensure backup_schedule.paused is false", "Enable regular backups for production clusters"]
        },
        {
            "condition": "c1: backup schedule must not be paused",
            "attribute_path": ["backup_schedule", 0, "paused"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details