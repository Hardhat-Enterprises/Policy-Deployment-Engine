resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/unauthorized-project/locations/asia-south1/clusters/random-cluster"  # Non-compliant: not in approved pattern
  location = "us-central1"
  project  = "test-project"
  
  retention_policy {
    backup_retain_days = 30
  }
}