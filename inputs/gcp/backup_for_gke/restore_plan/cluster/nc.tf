resource "google_gke_backup_restore_plan" "nc" {
  name        = "insecure-restore-plan"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/external-project/locations/us-central1/clusters/external-cluster"  # SECURITY RISK: External cluster!
  
  restore_config {
    all_namespaces = true  # SECURITY RISK: Restore everything
  }
}