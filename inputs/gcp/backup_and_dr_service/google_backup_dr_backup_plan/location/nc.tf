resource "google_backup_dr_backup_vault" "nc" {
  project  = "my-project-4418-1743628379470"
  location = "us-central1"
  backup_vault_id    = "backup-vault-non-compliant"
  access_restriction = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "100000s"
}

resource "google_backup_dr_backup_plan" "nc" {
  project        = "my-project-4418-1743628379470"
  location       = "us-central1"
  backup_plan_id = "backup-plan-non-compliant"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.nc.id

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