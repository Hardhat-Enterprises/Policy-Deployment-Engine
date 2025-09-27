resource "google_gke_backup_restore_plan" "nc" {
  name     = "nc"
  location = "asia-south1"  # Non-compliant: not in approved regions
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/asia-south1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/asia-south1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
  }
}