resource "google_spanner_backup_schedule" "nc" {
  instance           = "nc-instance"
  database           = "nc-database"
  name               = "nc"
  retention_duration = "86400s"
  full_backup_spec {}
  spec {
    cron_spec {
      text = "0 2 * * *"
    }
  }
  encryption_config {
    encryption_type = "GOOGLE_DEFAULT_ENCRYPTION"
  }
}
