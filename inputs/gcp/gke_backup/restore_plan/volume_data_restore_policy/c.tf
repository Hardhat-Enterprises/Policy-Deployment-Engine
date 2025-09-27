resource "google_gke_backup_restore_plan" "c" {
  name     = "c"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"  # Compliant: explicitly set to restore volume data
  }
}