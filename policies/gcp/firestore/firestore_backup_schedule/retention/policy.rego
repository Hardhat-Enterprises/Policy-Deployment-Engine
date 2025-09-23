package terraform.gcp.security.firestore_backup_schedule.retention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_backup_schedule.vars

# 只允许 retention >= 604800
conditions := [
    [
        {
            "situation_description": "Firestore backup schedules must retain backups for at least 7 days (604800 seconds).",
            "remedies": [
                "Set `retention = '604800'` (or longer) in the google_firestore_backup_schedule resource block."
            ]
        },
        {
            "condition": "Checks if retention duration is at least 604800 seconds",
            "attribute_path": ["retention"],
            "values": ["604800", "8467200","1209600"],   # whitelist: 604800s 及以上允许
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := helpers.get_multi_summary(conditions, vars.variables).message
#message := [m] if {
#    m := summary.message
#}
#
#message := ["All resources are compliant"] if {
#    not summary.message
#}
details := helpers.get_multi_summary(conditions, vars.variables).details

