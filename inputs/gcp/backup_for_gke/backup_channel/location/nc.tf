resource "google_gke_backup_backup_channel" "nc" {
  name                = "backup-channel-wrong-location"
  location            = "us-central1"  # Non-compliant: Not in Australia
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
}