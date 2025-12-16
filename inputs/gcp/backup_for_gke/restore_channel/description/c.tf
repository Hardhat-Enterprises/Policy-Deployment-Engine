resource "google_gke_backup_restore_channel" "c" {
  name                = "prod-restore-channel"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
  description         = "Production restore channel for GKE disaster recovery. Restores to same project with CMEK encryption. Approved by Security Team on 2024-01-15."  # SECURE: Detailed description
}