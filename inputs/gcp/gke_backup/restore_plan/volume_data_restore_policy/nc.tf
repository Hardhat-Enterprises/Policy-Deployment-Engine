resource "google_gke_backup_restore_plan" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    volume_data_restore_policy = "REUSE_VOLUME_HANDLE_FROM_BACKUP"  # Non-compliant: reusing volume handles can cause issues
  }
}