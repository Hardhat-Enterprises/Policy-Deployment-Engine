resource "google_gke_backup_restore_plan" "c" {
  name        = "secure-restore-plan"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"  # SECURE: Same project cluster
  
  restore_config {
    all_namespaces = false  # SECURE: Selective restore
    selected_namespaces {
      namespaces = ["production"]
    }
  }
}