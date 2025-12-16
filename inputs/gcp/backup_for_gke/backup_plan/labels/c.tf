resource "google_gke_backup_backup_plan" "c" {
  name     = "backup-plan-with-labels"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  labels = {
    environment     = "production"
    team            = "platform-engineering"
    compliance      = "required"
    backup-frequency = "daily"
    cost-center     = "engineering"
  }
}