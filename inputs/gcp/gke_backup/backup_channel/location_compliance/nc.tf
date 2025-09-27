resource "google_gke_backup_backup_channel" "nc" {
  name                = "nc"
  location           = "us-central1"
  destination_project = "projects/fluent-coder-468700-h4"
  project            = "fluent-coder-468700-h4"
  
  description = "Non-compliant backup channel in non-approved region"
  
  labels = {
    environment = "production"
    region      = "us-central1"
  }
}