resource "google_backup_dr_backup_vault" "nc1" {
  project                                    = "my-project-4418-1743628379470"
  location                                   = "australia-southeast1"
  backup_vault_id                            = "nc1"
  access_restriction                         = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "300000s"
}

resource "google_backup_dr_backup_plan" "nc2" {
  project        = "my-project-4418-1743628379470"
  location       = "australia-southeast1"
  backup_plan_id = "nc2"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.nc1.id

  backup_rules {
    rule_id               = "daily-rule"
    backup_retention_days = 10

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