resource "google_gke_backup_backup_plan" "c" {
  name     = "scheduled-backup-plan"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
  
  backup_schedule {
    cron_schedule = "0 2 * * *"  # Daily at 2 AM - compliant
  }
}