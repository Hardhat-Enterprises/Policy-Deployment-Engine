resource "google_gke_backup_restore_plan" "c" {
  name        = "secure-transformation-restore"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    # REMOVE: all_namespaces = false
    selected_namespaces {
      namespaces = ["production"]
    }
    
    transformation_rules {
      description = "Remove sensitive fields"
      field_actions {
        op = "REMOVE"
        path = "/spec/serviceAccountName"
      }
    }
    
    transformation_rules {
      description = "Remove privileged security context"
      field_actions {
        op = "REMOVE"
        path = "/spec/containers[]/securityContext/privileged"
      }
    }
  }
}