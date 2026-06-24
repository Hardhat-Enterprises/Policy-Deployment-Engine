resource "google_gke_backup_backup_channel" "compliant_example_1" {
  name                = "gke-backup-channel-compliant"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
}

