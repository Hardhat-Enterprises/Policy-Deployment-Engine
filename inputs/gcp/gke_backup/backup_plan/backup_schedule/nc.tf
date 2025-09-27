resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_schedule {
    cron_schedule = "0 2 * * *"
    paused = true  # Non-compliant: backups are paused
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}