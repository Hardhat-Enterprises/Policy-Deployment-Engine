resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast2/clusters/prod-cluster"
  location = "australia-southeast2"

  backup_config {
    all_namespaces = true
    include_secrets = true
    include_volume_data = true
    
    encryption_key {
      gcp_kms_encryption_key = "projects/fluent-coder-468700-h4/locations/australia-southeast2/keyRings/backup-ring/cryptoKeys/backup-key"
    }
  }

  backup_schedule {
    cron_schedule = "0 2 * * *"
    paused        = false
  }

  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days      = 90
    locked                  = false
  }
}