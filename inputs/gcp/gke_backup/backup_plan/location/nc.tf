resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/test-project/locations/asia-south1/clusters/my-cluster"
  location = "asia-south1"  # Non-compliant: not in approved regions
  project  = "test-project"
  
  retention_policy {
    backup_retain_days = 30
  }
}