package terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.schedule_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_backup_plan.vars

conditions := [[
  {
    "situation_description": "Backup plan does not have automated backup schedule configured",
    "remedies": ["Configure backup_schedule with cron_schedule for automated backups"]
  },
  {
    "condition": "backup_schedule.cron_schedule must be present",
    "attribute_path": ["backup_schedule", 0, "cron_schedule"],
    "values": [""],
    "policy_type": "blacklist"
  }
], [
  {
    "situation_description": "Backup plan is deactivated or has paused schedules",
    "remedies": ["Set deactivated = false and backup_schedule.paused = false"]
  },
  {
    "condition": "deactivated must be false",
    "attribute_path": ["deactivated"],
    "values": [false],
    "policy_type": "whitelist"
  },
  {
    "condition": "backup_schedule.paused must be false",
    "attribute_path": ["backup_schedule", 0, "paused"],
    "values": [false],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details