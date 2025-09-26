package terraform.gcp.security.gke_backup.backup_plan.prevent_backup_plan_deactivation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Policy to prevent backup plan deactivation
situations := [
    [
        {
            "situation_description": "Backup schedule must not be paused to ensure continuous backup protection",
            "remedies": ["Set paused to false", "Ensure backup schedule remains active"]
        },
        {
            "condition": "backup_plan_deactivation_check",
            "attribute_path": ["backup_schedule", 0, "paused"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details