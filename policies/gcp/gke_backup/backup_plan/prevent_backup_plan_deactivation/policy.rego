package terraform.gcp.security.gke_backup.backup_plan.prevent_backup_plan_deactivation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    {
        "situation_description": "GKE Backup plan must not be paused to ensure continuous protection",
        "remedies": ["Set paused to false in backup_schedule or remove the paused attribute"]
    },
    {
        "condition": "Checking if backup is paused",
        "attribute_path": ["backup_schedule", 0, "paused"],
        "values": [true],
        "policy_type": "blacklist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details