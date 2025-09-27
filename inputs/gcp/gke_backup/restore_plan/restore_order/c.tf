resource "google_gke_backup_restore_plan" "c" {
  name     = "c"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    
    restore_order {
      group_kind_dependencies {
        satisfying {
          resource_group = "v1"
          resource_kind  = "ConfigMap"
        }
        requiring {
          resource_group = "apps/v1"
          resource_kind  = "Deployment"
        }
      }
    }
  }
}