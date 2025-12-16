resource "google_gke_backup_backup_channel" "nc" {
  name                = "backup-channel-wrong-project"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/external-project-123"  # Non-compliant: Different project
}