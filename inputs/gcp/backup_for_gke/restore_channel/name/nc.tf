resource "google_gke_backup_restore_channel" "nc" {
  name                = "test123"  # SECURITY RISK: Non-descriptive name!
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
}