resource "google_backup_dr_backup_plan_association" "non_compliant_example_1" {
  project                    = "my-project-4418-1743628379470"
  location                   = "us-central1"
  resource_type              = "compute.googleapis.com/Instance"
  backup_plan_association_id = "non_compliant_example_1"
  resource                   = "nc2"
  backup_plan                = "nc3"
}
