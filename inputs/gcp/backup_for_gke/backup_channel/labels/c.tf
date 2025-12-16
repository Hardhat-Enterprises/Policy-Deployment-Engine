resource "google_gke_backup_backup_channel" "c" {
  name                = "backup-channel-with-labels"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
  
  labels = {
    environment = "production"
    team        = "platform"
    compliance  = "required"
    cost-center = "engineering"
  }
}