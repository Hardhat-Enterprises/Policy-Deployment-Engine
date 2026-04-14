resource "google_backup_dr_management_server" "c" {
  project  = "my-project-4418-1743628379470"
  location = "australia-southeast1"
  name     = "c"
  type     = "BACKUP_RESTORE"
}

