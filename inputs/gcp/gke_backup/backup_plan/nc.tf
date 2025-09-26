resource "google_gke_backup_backup_plan" "nc" {
  name        = "non-compliant-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/us-west1/clusters/test-cluster"
  location    = "us-west1"  # Non-compliant: Not an Australian region
  description = "Non-compliant backup plan"
  
  retention_policy {
    backup_delete_lock_days = 1      # Too short
    backup_retain_days      = 7      # Too short
    locked                  = false  # Not locked
  }
  
  backup_schedule {
    cron_schedule = "0 2 * * 0"  # Weekly (insufficient)
    paused        = true         # Paused (bad)
  }
  
  backup_config {
    include_volume_data = false      # Missing volume data
    include_secrets     = false      # Missing secrets
    
    selected_namespaces {
      namespaces = ["default"]       # Limited scope
    }
  }
}