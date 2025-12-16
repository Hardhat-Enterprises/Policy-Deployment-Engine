resource "google_gke_backup_backup_plan" "c" {
  name     = "secure-backup-plan-retention"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  retention_policy {
    backup_delete_lock_days = 30  # Security: Prevents accidental/malicious deletion
    backup_retain_days      = 90  # Security: Meets compliance requirements
    locked                  = true # Security: Prevents policy tampering
  }
}