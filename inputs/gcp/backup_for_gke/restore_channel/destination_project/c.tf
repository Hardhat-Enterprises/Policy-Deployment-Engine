resource "google_gke_backup_restore_channel" "c" {
  name                = "c"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  description         = "Restore channel for same-project disaster recovery"
}

