resource "google_backup_dr_management_server" "nc" {
  project  = "my-gcp-project"
  location = "us-central1"
  name     = "ms-nc"
}

