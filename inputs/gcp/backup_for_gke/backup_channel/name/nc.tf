resource "google_gke_backup_backup_channel" "nc" {
  name                = ""  # Non-compliant: Empty name
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
}