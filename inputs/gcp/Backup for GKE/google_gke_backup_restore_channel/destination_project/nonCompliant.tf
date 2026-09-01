resource "google_gke_backup_restore_channel" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "external-project-12345"
  description         = "Restore channel for same-project disaster recovery"
}

