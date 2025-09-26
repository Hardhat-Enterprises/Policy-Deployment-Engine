resource "google_gke_backup_restore_plan" "nc" {
  name         = "non-compliant-restore-plan"
  cluster      = "projects/fluent-coder-468700-h4/locations/us-east1/clusters/restore-cluster"
  location     = "us-east1"  # Non-compliant: Not Australian region
  backup_plan  = "projects/fluent-coder-468700-h4/locations/us-east1/backupPlans/backup-plan"
  description  = "Non-compliant restore plan for policy testing"
  
  restore_config {
    namespaced_resource_restore_mode = "FAIL_ON_CONFLICT"  # Non-compliant: Risky restore mode
    volume_data_restore_policy      = "NO_VOLUME_DATA_RESTORATION"  # Non-compliant: No volume data
    
    selected_namespaces {
      namespaces = ["default", "kube-system"]  # Non-compliant: Limited to selected namespaces
    }
    
    cluster_resource_restore_scope {
      selected_group_kinds {
        resource_group = ""
        resource_kind  = "ConfigMap"
      }
    }
    
    cluster_resource_conflict_policy = "USE_EXISTING_VERSION"  # Non-compliant: May keep outdated versions
    
    # Missing transformation rules - no data transformation applied
  }
}