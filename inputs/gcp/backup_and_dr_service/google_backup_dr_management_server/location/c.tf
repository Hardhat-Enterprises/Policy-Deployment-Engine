resource "google_backup_dr_management_server" "c" {
  project = "tamim-shahriar"
  location = "australia-southeast1"
  name     = "msconsole-c"
  type     = "BACKUP_RESTORE" 
}

