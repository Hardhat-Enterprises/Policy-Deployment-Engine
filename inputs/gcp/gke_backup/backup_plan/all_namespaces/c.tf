resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_config {
    all_namespaces = true  # Compliant: backing up all namespaces
    include_volume_data = true
    include_secrets = true
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}