resource "google_gke_backup_restore_channel" "nc" {
  name                = "nc"
  location           = "us-central1"
  destination_project = "projects/fluent-coder-468700-h4"
  project            = "fluent-coder-468700-h4"
  
  description = "Non-compliant restore channel in non-approved region"
  
  labels = {
    environment = "production"
    region      = "us-central1"
    operation   = "restore"
  }
}