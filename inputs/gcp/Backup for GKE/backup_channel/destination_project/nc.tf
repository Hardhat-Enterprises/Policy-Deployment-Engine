resource "google_gke_backup_backup_channel" "nc" {
  name = "nc"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "" # Violates existence check
}

