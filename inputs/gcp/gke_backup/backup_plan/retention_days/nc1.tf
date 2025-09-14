resource "google_gke_backup_backup_plan" "nc1" {
  name     = "short-retention-plan"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
  
  retention_policy {
    backup_retain_days = 1  # Only 1 day - too short
  }
}