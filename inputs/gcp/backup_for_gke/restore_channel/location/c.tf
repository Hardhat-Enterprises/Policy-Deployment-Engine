resource "google_gke_backup_restore_channel" "c" {
  name                = "compliant-restore-channel"
  location            = "australia-southeast1"  # SECURE: Data residency compliant
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
}