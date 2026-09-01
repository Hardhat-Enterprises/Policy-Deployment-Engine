resource "google_backup_dr_backup_plan" "non_compliant_example_1" {
  project        = "my-project-4418-1743628379470"
  location       = "australia-southeast1"
  backup_plan_id = "non_compliant_example_1"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = "c2"

  log_retention_days = 10
}
