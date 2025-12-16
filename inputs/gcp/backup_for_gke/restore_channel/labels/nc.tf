resource "google_gke_backup_restore_channel" "nc" {
  name                = "unlabeled-restore-channel"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
  # SECURITY RISK: No security labels for tracking and compliance!
}