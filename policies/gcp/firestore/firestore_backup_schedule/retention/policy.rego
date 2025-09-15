package terraform.gcp.firestore.backup_schedule.retention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore backup schedules must retain backups for at least 7 days (604800 seconds).",
            "remedies": [
                "Set `retention = '604800s'` (or longer) in the google_firestore_backup_schedule resource block."
            ]
        },
        {
            "condition": "Checks if retention duration is >= 604800 seconds",
            "attribute_path": ["retention"],
            "values": ["604800s"],
            "policy_type": "min_duration"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details