resource "google_gke_backup_backup_plan" "nc" {
  name     = "insecure-backup-plan-retention"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  retention_policy {
    backup_delete_lock_days = 0    # SECURITY RISK: No protection against deletion
    backup_retain_days      = 3    # SECURITY RISK: Too short for incident response
    locked                  = false # SECURITY RISK: Policy can be changed
  }
}