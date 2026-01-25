resource "google_gke_backup_restore_channel" "nc" {
  name = "nc"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
}

