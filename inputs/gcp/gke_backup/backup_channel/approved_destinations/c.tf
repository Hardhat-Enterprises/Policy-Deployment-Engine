resource "google_gke_backup_backup_channel" "c" {
  name                = "c"
  location           = "australia-southeast1"
  destination_project = "projects/fluent-coder-468700-h4"
  project            = "fluent-coder-468700-h4"
  
  description = "Approved backup channel for production workloads"
  
  labels = {
    environment = "production"
    team        = "platform"
    security    = "approved"
  }
}