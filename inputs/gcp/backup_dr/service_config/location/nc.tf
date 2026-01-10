resource "google_backup_dr_service_config" "nc" {

  project       = "my-gcp-project"
  location      = "us-central1"
  resource_type = "compute.googleapis.com/Instance"
}