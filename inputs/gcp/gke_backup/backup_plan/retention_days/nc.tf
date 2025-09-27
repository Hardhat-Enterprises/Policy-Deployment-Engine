resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  retention_policy {
    backup_retain_days = 3  # Non-compliant: less than 7 days
    backup_delete_lock_days = 0
  }
}