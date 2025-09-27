resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"  # Compliant: approved region
  project  = "test-project"
  
  retention_policy {
    backup_retain_days = 30
  }
}