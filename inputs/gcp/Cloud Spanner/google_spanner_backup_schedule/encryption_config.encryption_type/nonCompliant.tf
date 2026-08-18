resource "google_spanner_backup_schedule" "non_compliant_example_1" {
  instance           = "nc-instance"
  database           = "nc-database"
  name               = "non_compliant_example_1"
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
