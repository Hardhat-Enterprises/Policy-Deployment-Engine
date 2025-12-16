resource "google_gke_backup_backup_plan" "c" {
  name     = "secure-backup-schedule"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_schedule {
    cron_schedule = "0 */4 * * *"  # SECURITY: Frequent backups (every 4 hours)
    paused        = false           # SECURITY: Active backups for recovery
  }
}