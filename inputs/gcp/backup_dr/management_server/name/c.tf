resource "google_backup_dr_management_server" "c" {
  project  = "my-gcp-project"
  location = "australia-southeast1"
  name     = "ms-prod-01"
}

