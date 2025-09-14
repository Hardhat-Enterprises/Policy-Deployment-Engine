package terraform.gcp.security.gke_backup.backup_plan.paused
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.backup_plan.vars

conditions := [
    [
        {
            "situation_description": "Backup schedule is paused",
            "remedies": ["Ensure backup schedules are not paused (paused = false)"]
        },
        {
            "condition": "Check if schedule is paused",
            "attribute_path": ["backup_schedule", "paused"],  # No index needed
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details