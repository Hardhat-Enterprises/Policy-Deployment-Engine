package terraform.gcp.security.firestore_backup_schedule.weekly_recurrence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_backup_schedule.vars

conditions := [
    [
        {
            "situation_description": "Firestore backup schedules must use weekly_recurrence with MONDAY to guarantee weekly backups.",
            "remedies": [
                "Set `weekly_recurrence = { day = \"MONDAY\" }` in the google_firestore_backup_schedule resource block."
            ]
        },
        {
#            "condition": "Checks if weekly_recurrence block is present",
            "condition": "Checks if weekly_recurrence.day is MONDAY",
            "attribute_path": ["weekly_recurrence"],
            "values": [ { "day": "MONDAY" } ], # 只接受 weekly_recurrence 块
            "policy_type": "whitelist"
#            "policy_type": "existence"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

#message := helpers.get_multi_summary(conditions, vars.variables).message
message := [m] if {
    m := summary.message
}

message := ["All resources are compliant"] if {
    not summary.message
}
details := helpers.get_multi_summary(conditions, vars.variables).details
