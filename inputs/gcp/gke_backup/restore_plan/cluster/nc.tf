resource "google_gke_backup_restore_plan" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/unauthorized-project/locations/asia-south1/clusters/random-cluster"  # Non-compliant: unapproved cluster
  
  restore_config {
    all_namespaces = true
  }
}