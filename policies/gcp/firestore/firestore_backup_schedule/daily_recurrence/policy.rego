package terraform.gcp.firestore.backup_schedule.daily_recurrence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore backup schedules must use daily_recurrence to ensure daily backups.",
            "remedies": [
                "Set `daily_recurrence = {}` in the google_firestore_backup_schedule resource block."
            ]
        },
        {
            "condition": "Checks if daily_recurrence block is present",
            "attribute_path": ["daily_recurrence"],
            "values": [{}],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

