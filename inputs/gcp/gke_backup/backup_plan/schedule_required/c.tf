resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/my-cluster"
  location = "australia-southeast1"
  project  = "fluent-coder-468700-h4"

  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }

  # Required automated backup schedule
  backup_schedule {
    cron_schedule = "0 2 * * *"  # Daily at 2 AM
    paused        = false
  }

  retention_policy {
    backup_delete_lock_days = 7
    backup_retain_days      = 30
    locked                  = true
  }

  # Plan is active
  deactivated = false

  labels = {
    environment   = "production"
    backup_type   = "automated"
    schedule      = "daily"
  }
}