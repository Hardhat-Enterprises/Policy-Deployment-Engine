resource "google_gke_backup_backup_plan" "nc" {
  name     = "insecure-backup-schedule"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_schedule {
    cron_schedule = "0 0 * * 0"  # SECURITY RISK: Only weekly backups
    paused        = true          # SECURITY RISK: Backups disabled
  }
}