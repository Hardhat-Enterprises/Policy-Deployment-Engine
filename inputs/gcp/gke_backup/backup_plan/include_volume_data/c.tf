resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_config {
    include_volume_data = true  # Compliant: volume data is included in backups
    include_secrets = true
    all_namespaces = true
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}