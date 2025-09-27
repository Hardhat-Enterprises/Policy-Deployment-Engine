resource "google_gke_backup_restore_plan" "c" {
  name     = "c"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    
    cluster_resource_restore_scope {
      selected_group_kinds {
        resource_group = "storage.k8s.io"
        resource_kind  = "StorageClass"
      }
      selected_group_kinds {
        resource_group = "apiextensions.k8s.io"
        resource_kind  = "CustomResourceDefinition"
      }
    }
  }
}