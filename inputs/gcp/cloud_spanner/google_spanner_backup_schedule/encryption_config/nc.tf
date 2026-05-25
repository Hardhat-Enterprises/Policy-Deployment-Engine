resource "google_spanner_backup_schedule" "nc1" {
  instance           = google_spanner_instance.nc1_instance.name
  database           = google_spanner_database.nc1_database.name
  name               = "nc1-backup-schedule"
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
resource "google_spanner_instance" "nc1_instance" {
  name         = "test-instance-nc1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC1"
  num_nodes    = 1
}
resource "google_spanner_database" "nc1_database" {
  instance = google_spanner_instance.nc1_instance.name
  name     = "nc1-database"
}
