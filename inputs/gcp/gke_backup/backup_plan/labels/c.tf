resource "google_gke_backup_backup_plan" "c" {
  name     = "labeled-backup-plan"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
  
  labels = {
    environment = "production"
    team        = "platform"
    cost-center = "engineering"
  }
}