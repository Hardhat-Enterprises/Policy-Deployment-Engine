resource "google_gke_backup_restore_channel" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  destination_project = "projects/PDE"
  description         = "Compliant restore channel"
}
