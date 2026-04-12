resource "google_backup_dr_management_server" "nc" {
  project = "tamim-shahriar"
  location = "us-central1"
  name     = "msconsole-nc"
  type     = "BACKUP_RESTORE" 
}