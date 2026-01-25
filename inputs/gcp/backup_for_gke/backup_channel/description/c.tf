resource "google_gke_backup_backup_channel" "c" {
  name                = "c"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  description         = "Production backup channel for GKE cluster backup operations"
}

