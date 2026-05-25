resource "google_spanner_backup_schedule" "nc1" {
  instance           = "nc1-instance"
  database           = "nc1-database"
  name               = "nc1"
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
