resource "google_gke_backup_restore_plan" "c" {
  name     = "c"
  location = "us-central1"
  project  = "test-project"
  
  backup_plan = "projects/test-project/locations/us-central1/backupPlans/my-backup-plan"
  cluster     = "projects/test-project/locations/us-central1/clusters/restore-cluster"
  
  restore_config {
    all_namespaces = true
    
    transformation_rules {
      description = "Change service type from LoadBalancer to ClusterIP"
      
      resource_filter {
        namespaces = ["production", "staging"]
        group_kinds {
          resource_group = "v1"  # Compliant: specific resource group
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