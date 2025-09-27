resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  deactivated = true  # Non-compliant: backup plan is deactivated
  
  retention_policy {
    backup_retain_days = 30
  }
}