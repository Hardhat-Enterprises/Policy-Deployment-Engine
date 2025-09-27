resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_config {
    include_secrets = true  # Compliant: secrets are included in backups
    include_volume_data = true
    all_namespaces = true
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}