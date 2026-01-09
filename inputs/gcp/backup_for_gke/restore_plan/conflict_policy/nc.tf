resource "google_gke_backup_restore_plan" "nc" {
  name        = "dangerous-conflict-policy"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    # REMOVE: all_namespaces = false
    selected_namespaces {
      namespaces = ["production"]
    }
    cluster_resource_conflict_policy = "USE_BACKUP_VERSION"  # SECURITY RISK: Overwrites!
  }
}