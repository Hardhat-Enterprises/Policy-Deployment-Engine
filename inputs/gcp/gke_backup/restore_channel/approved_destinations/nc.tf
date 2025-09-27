resource "google_gke_backup_restore_channel" "nc" {
  name                = "nc"
  location           = "australia-southeast1"
  destination_project = "projects/external-untrusted-project"
  project            = "fluent-coder-468700-h4"
  
  description = "Restore channel pointing to external project"
  
  labels = {
    environment = "test"
    team        = "unknown"
  }
}