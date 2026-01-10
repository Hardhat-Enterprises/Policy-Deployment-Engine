resource "google_backup_dr_backup_plan" "c" {
  project  = "my-gcp-project"
  location      = "australia-southeast1"
  resource_type = "compute.googleapis.com/Instance"
}
