resource "google_gke_backup_restore_plan" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = false  # Non-compliant: not restoring all namespaces
    # And no selected_namespaces defined
    namespaced_resource_restore_mode = "FAIL_ON_CONFLICT"
  }
}