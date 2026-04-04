# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_backup_dr_backup_vault" "nc" {
  project  = "PDE"
  location = "australia-southeast1"

  backup_vault_id    = "nc"
  access_restriction = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "100000s"
}

resource "google_backup_dr_backup_plan" "nc" {
  location       = "australia-southeast1"
  backup_plan_id = "backup-plan-noncompliant"
  resource_type  = "sqladmin.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.nc.name

  log_retention_days = 14

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