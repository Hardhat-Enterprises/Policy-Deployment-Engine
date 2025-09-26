resource "google_gke_backup_backup_plan" "c" {
  name        = "compliant-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/test-cluster"
  location    = "australia-southeast1"  # Compliant: Australian region
  description = "Compliant backup plan"
  
  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days      = 365
    locked                  = true
  }
  
  backup_schedule {
    cron_schedule = "0 2 * * *"  # Daily schedule
    paused        = false        # Not paused
  }
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}