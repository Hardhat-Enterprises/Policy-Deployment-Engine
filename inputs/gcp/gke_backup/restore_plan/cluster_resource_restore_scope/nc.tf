resource "google_gke_backup_restore_plan" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    
    cluster_resource_restore_scope {
      no_group_kinds = true  # Non-compliant: not restoring any cluster resources
    }
  }
}