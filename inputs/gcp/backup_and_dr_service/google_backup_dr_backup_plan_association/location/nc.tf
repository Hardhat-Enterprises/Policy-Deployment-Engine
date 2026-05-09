resource "google_backup_dr_backup_plan_association" "nc" {
  project                    = "my-project-4418-1743628379470"
  location                   = "us-central1"
  resource_type              = "compute.googleapis.com/Instance"
  backup_plan_association_id = "nc"
  resource                   = "nc2"
  backup_plan                = "nc3"
}
