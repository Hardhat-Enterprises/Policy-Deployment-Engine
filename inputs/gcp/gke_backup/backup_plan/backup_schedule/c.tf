resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_schedule {
    cron_schedule = "0 2 * * *"  # Daily at 2 AM
    paused = false  # Compliant: backups are active
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}