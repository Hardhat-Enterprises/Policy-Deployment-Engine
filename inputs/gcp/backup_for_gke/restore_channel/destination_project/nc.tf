resource "google_gke_backup_restore_channel" "nc" {
  name                = "cross-project-restore"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/external-project-12345"  # SECURITY RISK: External project!
}