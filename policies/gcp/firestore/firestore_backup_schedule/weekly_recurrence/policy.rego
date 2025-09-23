package terraform.gcp.security.firestore_backup_schedule.weekly_recurrence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_backup_schedule.vars

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
            "values": [{}], # 只接受 weekly_recurrence 块
            "policy_type": "whitelist"
#            "policy_type": "existence"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

#message := helpers.get_multi_summary(conditions, vars.variables).message
#details := helpers.get_multi_summary(conditions, vars.variables).details

# compute failing resource names (only root_module)
resource_type := vars.variables.resource_type
resources := [r | r := input.planned_values.root_module.resources[_]; r.type == resource_type]
missing_weekly := { r.name | r := resources[_]; not r.values.weekly_recurrence }

# overwrite message with only failing resources
message := [ sprintf("Resource '%s' does not define `weekly_recurrence`", [name]) | name := missing_weekly[_] ]

# keep original details if you want (or rebuild details similarly)
details := summary.details