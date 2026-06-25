package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.log_retention_days

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Log retention period is too short and may not provide sufficient support for security auditing, monitoring, and incident investigation.",
            "remedies": [
                "Increase log_retention_days to at least 30 days.",
                "Ensure log retention meets organisational audit and investigation requirements.",
                "Review backup plan logging settings and apply an appropriate retention period."
            ]
        },
        {
            "condition": "Check whether log_retention_days is at least 30 days.",
            "attribute_path": ["log_retention_days"],
            "values": [30, 1000],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
