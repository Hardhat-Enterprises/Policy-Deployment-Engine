resource "google_gke_backup_restore_plan" "nc" {
  name        = "full-cluster-restore"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    cluster_resource_restore_scope {
      all_group_kinds = true  # SECURITY RISK: Restores ALL cluster resources including RBAC!
    }
  }
}