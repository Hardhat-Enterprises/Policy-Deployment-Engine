package terraform.gcp.security.firestore_backup_schedule.weekly_recurrence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore backup schedules must use weekly_recurrence to guarantee weekly backups.",
            "remedies": [
                "Set `weekly_recurrence = {}` in the google_firestore_backup_schedule resource block."
            ]
        },
        {
            "condition": "Checks if weekly_recurrence block is present",
            "attribute_path": ["weekly_recurrence"],
            "values": [{}],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details