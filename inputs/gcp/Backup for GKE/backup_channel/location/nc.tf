resource "google_gke_backup_backup_channel" "nc" {
  name = "nc"
  location            = "us-central1"
  project             = "PDE"
  destination_project = "projects/PDE"
}

