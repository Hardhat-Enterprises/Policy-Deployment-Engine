resource "google_backup_dr_backup_plan" "nc" {
  project        = "my-project-4418-1743628379470"
  location       = "australia-southeast1"
  backup_plan_id = "nc"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = "nc2"

  log_retention_days = 10
}