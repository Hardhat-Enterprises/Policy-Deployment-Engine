resource "google_backup_dr_management_server" "nc" {
  project  = "my-project-4418-1743628379470"
  location = "us-central1"
  name     = "nc"
  type     = "BACKUP_RESTORE"
}