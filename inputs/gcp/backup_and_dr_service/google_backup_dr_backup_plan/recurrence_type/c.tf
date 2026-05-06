resource "google_backup_dr_backup_plan" "c" {
  project        = "my-project-4418-1743628379470"
  location       = "australia-southeast1"
  backup_plan_id = "c"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = "c2"

  backup_rules {
    rule_id               = "daily-rule"
    backup_retention_days = 30

    standard_schedule {
      recurrence_type = "DAILY"
      time_zone       = "Australia/Melbourne"
    }
  }
}
