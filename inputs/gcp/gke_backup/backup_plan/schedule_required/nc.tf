resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/my-cluster"
  location = "australia-southeast1"
  project  = "fluent-coder-468700-h4"

  backup_config {
    include_volume_data = true
    include_secrets     = false
    all_namespaces      = true
  }

  # Missing backup schedule - manual backups only
  # backup_schedule block is missing

  retention_policy {
    backup_delete_lock_days = 1
    backup_retain_days      = 7
    locked                  = false
  }

  # Plan is deactivated
  deactivated = true

  labels = {
    environment = "test"
    backup_type = "manual"
  }
}