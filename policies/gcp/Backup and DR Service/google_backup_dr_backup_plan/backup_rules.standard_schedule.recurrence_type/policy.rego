package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.backup_rules_standard_schedule_recurrence_type

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup recurrence type is too infrequent and may not meet organisational recovery requirements.",
            "remedies": [
                "Set recurrence_type to an approved frequency such as HOURLY, DAILY, or WEEKLY.",
                "Avoid using infrequent schedules that reduce backup coverage and recovery readiness.",
                "Review backup frequency requirements for the protected workload."
            ]
        },
        {
            "condition": "Check whether recurrence_type is set to an approved backup frequency.",
            "attribute_path": ["backup_rules", 0, "standard_schedule", 0, "recurrence_type"],
            "values": ["HOURLY", "DAILY", "WEEKLY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
