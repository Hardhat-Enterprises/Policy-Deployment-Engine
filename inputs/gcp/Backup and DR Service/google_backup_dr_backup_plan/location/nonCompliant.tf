resource "google_backup_dr_backup_plan" "non_compliant_example_1" {
  project        = "my-project-4418-1743628379470"
  location       = "us-central1"
  backup_plan_id = "non_compliant_example_1"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = "nc2"
}
