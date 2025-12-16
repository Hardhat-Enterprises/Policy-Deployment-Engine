resource "google_gke_backup_restore_plan" "c" {
  name        = "secure-field-transformation"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    transformation_rules {
      description = "Remove service accounts"
      field_actions {
        op   = "REMOVE"
        path = "/spec/serviceAccountName"  # SECURE: Remove service accounts
      }
    }
    
    transformation_rules {
      description = "Remove secrets"
      field_actions {
        op   = "REMOVE"
        path = "/spec/containers[]/env[]/valueFrom/secretKeyRef"  # SECURE: Remove secret references
      }
    }
    
    transformation_rules {
      description = "Remove privileged mode"
      field_actions {
        op    = "REPLACE"
        path  = "/spec/containers[]/securityContext/privileged"
        value = "false"  # SECURE: Disable privileged mode
      }
    }
  }
}