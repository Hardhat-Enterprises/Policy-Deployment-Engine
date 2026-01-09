resource "google_gke_backup_restore_plan" "nc" {
  name        = "no-namespace-exclusions"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    all_namespaces = true
    # SECURITY RISK: No excluded namespaces - will restore system namespaces!
  }
}