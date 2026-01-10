resource "google_backup_dr_management_server" "nc" {
  project  = "my-gcp-project"
  location = "australia-southeast1"
  name     = "ManagementServer"
}


