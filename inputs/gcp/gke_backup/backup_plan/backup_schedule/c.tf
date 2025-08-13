resource "google_gke_backup_backup_plan" "compliant" {
  name = "compliant-schedule-backup"
  cluster = "projects/my-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  
  backup_schedule {
    cron_schedule = "0 2 * * *"  # Daily at 2 AM - compliant
  }
  
  retention_policy {
    backup_retain_days = 7
  }
}