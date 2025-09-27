resource "google_gke_backup_restore_plan" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    
    transformation_rules {
      description = "Apply to all resources"
      
      resource_filter {
        namespaces = ["default"]
        group_kinds {
          resource_group = "*"  # Non-compliant: using wildcard for all resource groups
          resource_kind  = "Service"
        }
      }
      
      field_actions {
        op = "REPLACE"
        path = "/spec/type"
        value = "ClusterIP"
      }
    }
  }
}