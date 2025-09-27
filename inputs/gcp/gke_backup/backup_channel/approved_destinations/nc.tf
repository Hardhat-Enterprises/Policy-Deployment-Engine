resource "google_gke_backup_backup_channel" "nc" {
  name                = "nc"
  location           = "australia-southeast1"
  destination_project = "projects/external-untrusted-project"
  project            = "fluent-coder-468700-h4"
  
  description = "Backup channel pointing to external project"
  
  labels = {
    environment = "test"
    team        = "unknown"
  }
}