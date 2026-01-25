resource "google_gke_backup_restore_channel" "c" {
  name                = "gke-restore-channel-prod"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  description         = "Production restore channel for Australia Southeast 1"
}

