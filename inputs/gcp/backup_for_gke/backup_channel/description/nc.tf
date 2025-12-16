resource "google_gke_backup_backup_channel" "nc" {
  name                = "backup-channel-no-desc"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
  # Missing description - non-compliant
}