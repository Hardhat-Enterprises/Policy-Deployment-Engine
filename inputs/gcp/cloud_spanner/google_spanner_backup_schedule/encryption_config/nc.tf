resource "google_spanner_backup_schedule" "nc" {
  instance           = google_spanner_instance.nc_instance.name
  database           = google_spanner_database.nc_database.name
  name               = "nc-backup-schedule"
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
resource "google_spanner_instance" "nc_instance" {
  name         = "test-instance-nc"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC"
  num_nodes    = 1
}
resource "google_spanner_database" "nc_database" {
  instance = google_spanner_instance.nc_instance.name
  name     = "nc-database"
}
