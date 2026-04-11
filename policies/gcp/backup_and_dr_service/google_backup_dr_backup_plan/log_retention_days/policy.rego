package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.log_retention_days

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Log retention period is too short and may not provide sufficient audit or investigation coverage.",
            "remedies": [
                "Increase log_retention_days to at least 30 days.",
                "Ensure log retention supports audit, monitoring, and investigation requirements.",
                "Review the backup plan configuration and apply an appropriate log retention period."
            ]
        },
        {
            "condition": "Check whether log_retention_days is at least 30 days.",
            "attribute_path": ["log_retention_days"],
            "values": [30, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details