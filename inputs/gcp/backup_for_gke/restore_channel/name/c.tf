resource "google_gke_backup_restore_channel" "c" {
  name                = "prod-restore-channel-ausoutheast1"  # SECURE: Follows naming convention
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
  description         = "Production restore channel for Australia Southeast 1"
}