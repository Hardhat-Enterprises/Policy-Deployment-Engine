resource "google_gke_backup_backup_channel" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  location            = "us-central1"
  project             = "PDE"
  destination_project = "projects/PDE"
}

