resource "google_gke_backup_restore_plan" "c" {
  name     = "c"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/prod-cluster"  # Compliant: approved cluster
  
  restore_config {
    all_namespaces = true
  }
}