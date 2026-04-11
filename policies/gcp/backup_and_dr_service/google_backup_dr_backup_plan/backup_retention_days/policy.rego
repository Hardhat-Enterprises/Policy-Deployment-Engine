package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.backup_retention_days

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup retention period is too short and may not provide sufficient recovery or compliance coverage.",
            "remedies": [
                "Increase backup_retention_days to at least 30 days.",
                "Ensure backup retention meets recovery and compliance requirements.",
                "Review the backup rule configuration and apply an appropriate retention period."
            ]
        },
        {
            "condition": "Check whether backup_retention_days is at least 30 days.",
            "attribute_path": ["backup_rules", 0, "backup_retention_days"],
            "values": [30, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
