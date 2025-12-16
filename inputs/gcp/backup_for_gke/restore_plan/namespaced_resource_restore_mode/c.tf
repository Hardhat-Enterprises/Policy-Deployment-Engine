resource "google_gke_backup_restore_plan" "c" {
  name        = "safe-conflict-handling"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    
    selected_namespaces {
      namespaces = ["production"]
    }
    namespaced_resource_restore_mode = "FAIL_ON_CONFLICT"
  }
}