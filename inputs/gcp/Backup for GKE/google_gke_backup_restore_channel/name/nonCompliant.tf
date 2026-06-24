resource "google_gke_backup_restore_channel" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "australia-southeast1"
  destination_project = "projects/PDE"
  description         = "Non-compliant restore channel"
}
