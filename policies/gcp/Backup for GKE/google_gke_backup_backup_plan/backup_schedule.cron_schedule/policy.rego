package terraform.gcp.security.backup_for_gke.backup_plan.backup_schedule_cron_schedule
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars

conditions := [
    [
    {
      "situation_description": "Backup Plan schedule must be one of the approved schedules.",
      "remedies": ["Set backup_schedule.cron_schedule to '0 2 * * *', '0 3 * * *', or '0 4 * * *'."]
    },
    {
      "condition": "Backup schedule must be one of: 0 2 * * *, 0 3 * * *, 0 4 * * *",
      "attribute_path": ["backup_schedule", 0, "cron_schedule"],
      "values": ["0 2 * * *", "0 3 * * *", "0 4 * * *"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details