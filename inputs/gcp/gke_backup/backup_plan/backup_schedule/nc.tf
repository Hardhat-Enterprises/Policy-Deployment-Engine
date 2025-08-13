resource "google_gke_backup_backup_plan" "non_compliant" {
  name = "non-compliant-schedule-backup"
  cluster = "projects/my-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  
  backup_schedule {
    cron_schedule = ""  # Empty schedule - non-compliant!
  }
  
  retention_policy {
    backup_retain_days = 7
  }
}