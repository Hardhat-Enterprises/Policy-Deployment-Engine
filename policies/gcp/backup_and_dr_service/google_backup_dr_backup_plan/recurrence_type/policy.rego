package terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.recurrence_type

import data.terraform.helpers
import data.terraform.gcp.security.backup_and_dr_service.google_backup_dr_backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup recurrence type is not set to a supported value, which may result in an invalid or non-compliant backup schedule.",
            "remedies": [
                "Set recurrence_type to one of the supported values: HOURLY, DAILY, WEEKLY, MONTHLY, or YEARLY.",
                "Ensure the selected recurrence_type matches the intended backup frequency and business recovery requirements.",
                "Review related schedule fields such as hourly_frequency, days_of_week, days_of_month, week_day_of_month, and months for consistency with the selected recurrence_type."
            ]
        },
        {
            "condition": "Check whether recurrence_type is set to a supported value.",
            "attribute_path": ["backup_rules", 0, "standard_schedule", 0, "recurrence_type"],
            "values": ["HOURLY", "DAILY", "WEEKLY", "MONTHLY", "YEARLY"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

