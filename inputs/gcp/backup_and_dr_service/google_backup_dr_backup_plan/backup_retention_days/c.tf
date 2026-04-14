resource "google_backup_dr_backup_vault" "c1" {
  project                                    = "my-project-4418-1743628379470"
  location                                   = "australia-southeast1"
  backup_vault_id                            = "c1"
  access_restriction                         = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "300000s"
}

resource "google_backup_dr_backup_plan" "c2" {
  project        = "my-project-4418-1743628379470"
  location       = "australia-southeast1"
  backup_plan_id = "c2"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.c1.id

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