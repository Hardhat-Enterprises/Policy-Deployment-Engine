resource "google_backup_dr_backup_plan" "c" {
  project  = "my-gcp-project"
  location = "australia-southeast1"

  backup_plan_id = "c"


  resource_type = "compute.googleapis.com/Instance"

  backup_vault = "projects/my-gcp-project/locations/australia-southeast1/backupVaults/c"

  backup_rules {
    rule_id = "rule-1"

    backup_retention_days = 30

    standard_schedule {
      recurrence_type = "DAILY"
      time_zone       = "Australia/Sydney"
    }
  }
}

