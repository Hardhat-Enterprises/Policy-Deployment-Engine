package terraform.gcp.security.gke_backup.backup_plan.mandatory_backup_scheduling

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

# Policy to ensure backup scheduling is properly configured
situations := [
    [
        {
            "situation_description": "Backup schedule must not be paused",
            "remedies": ["Set paused to false", "Enable backup scheduling"]
        },
        {
            "condition": "backup_schedule_paused_check",
            "attribute_path": ["backup_schedule", 0, "paused"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Daily backup schedule is required",
            "remedies": ["Update cron schedule to run daily", "Use format '0 2 * * *' for daily at 2 AM"]
        },
        {
            "condition": "backup_schedule_frequency_check",
            "attribute_path": ["backup_schedule", 0, "cron_schedule"],
            "values": ["0 2 * * 0"],  # Weekly schedule (insufficient)
            "policy_type": "blacklist"
        }
    ]
]

# Main policy entry point
message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details