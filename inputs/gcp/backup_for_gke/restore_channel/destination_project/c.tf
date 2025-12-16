resource "google_gke_backup_restore_channel" "c" {
  name                = "secure-restore-channel"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"  # SECURE: Same project restore
  description         = "Restore channel for same-project disaster recovery"
}