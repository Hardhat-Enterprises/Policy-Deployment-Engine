resource "google_gke_backup_restore_plan" "c" {
  name        = "selective-restore-plan"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    # REMOVE this line: all_namespaces = false
    # Just use selected_namespaces - this implies NOT all_namespaces
    selected_namespaces {
      namespaces = ["production", "critical-apps"]
    }
    
    transformation_rules {
      description = "Security policy for restore"
      field_actions {
        op = "REMOVE"
        path = "/spec/serviceAccountName"
      }
    }
  }
}