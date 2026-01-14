resource "google_backup_dr_backup_plan" "nc" {
  project  = "my-gcp-project"
  location = "us-central1" 

  backup_plan_id = "nc"

  resource_type = "compute.googleapis.com/Instance"

  backup_vault = "projects/my-gcp-project/locations/us-central1/backupVaults/nc"

  backup_rules {
    rule_id = "rule-1"
    backup_retention_days = 30

    standard_schedule {
      recurrence_type = "DAILY"
      time_zone       = "Australia/Sydney"
    }
  }
}
