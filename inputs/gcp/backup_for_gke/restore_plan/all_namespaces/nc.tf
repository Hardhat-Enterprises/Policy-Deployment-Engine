resource "google_gke_backup_restore_plan" "nc" {
  name        = "overpermissive-restore-plan"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    all_namespaces = true  # SECURITY RISK: Restoring everything!
    # No transformation rules - keeping original service accounts
  }
}