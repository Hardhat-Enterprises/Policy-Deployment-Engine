resource "google_gke_backup_restore_channel" "nc" {
  name                = "non-compliant-restore-channel"
  location            = "us-central1"  # SECURITY RISK: Outside approved region!
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
}