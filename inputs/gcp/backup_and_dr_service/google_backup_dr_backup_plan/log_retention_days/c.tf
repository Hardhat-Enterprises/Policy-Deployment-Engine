# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_backup_dr_backup_plan" "c" {
  location       = "australia-southeast1"
  backup_plan_id = "backup-plan-compliant"
  resource_type  = "sqladmin.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.c.name

  log_retention_days = 30

  backup_rules {
    rule_id               = "daily-rule"
    backup_retention_days = 30

    standard_schedule {
      recurrence_type = "DAILY"
      time_zone       = "Australia/Melbourne"

      backup_window {
        start_hour_of_day = 1
        end_hour_of_day   = 3
      }
    }
  }
}
