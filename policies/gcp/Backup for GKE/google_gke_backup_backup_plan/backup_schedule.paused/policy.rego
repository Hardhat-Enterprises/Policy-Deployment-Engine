package terraform.gcp.security.backup_for_gke.backup_plan.backup_schedule_paused
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars

conditions := [
    [
    {
      "situation_description": "Backup Plan schedule must not be paused.",
      "remedies": ["Set backup_schedule.paused to false."]
    },
    {
      "condition": "Backup schedule must not be paused",
      "attribute_path": ["backup_schedule", 0, "paused"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details