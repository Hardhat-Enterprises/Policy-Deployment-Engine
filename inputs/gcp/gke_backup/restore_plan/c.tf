resource "google_gke_backup_restore_plan" "c" {
  name         = "compliant-restore-plan"
  cluster      = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/restore-cluster"
  location     = "australia-southeast1"
  backup_plan  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/backup-plan"
  description  = "Compliant restore plan with proper configuration"
  
  restore_config {
    all_namespaces                 = true
    namespaced_resource_restore_mode = "DELETE_AND_RESTORE"
    volume_data_restore_policy      = "RESTORE_VOLUME_DATA_FROM_BACKUP"
    cluster_resource_restore_scope {
      all_group_kinds = true
    }
    cluster_resource_conflict_policy = "USE_BACKUP_VERSION"
    
    transformation_rules {
      description = "Transform namespace labels"
      field_actions {
        op    = "REPLACE"
        path  = "/metadata/labels/environment"
        value = "production"
      }
      resource_filter {
        namespaces = ["default"]
        group_kinds {
          resource_group = ""
          resource_kind  = "Namespace"
        }
      }
    }
  }
}