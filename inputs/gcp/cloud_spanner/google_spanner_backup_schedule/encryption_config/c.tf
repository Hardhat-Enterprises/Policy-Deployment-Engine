resource "google_spanner_backup_schedule" "c" {
  instance           = google_spanner_instance.c_instance.name
  database           = google_spanner_database.c_database.name
  name               = "c-backup-schedule"
  retention_duration = "86400s"
  full_backup_spec {}
  spec {
    cron_spec {
      text = "0 2 * * *"
    }
  }
  encryption_config {
    encryption_type = "CUSTOMER_MANAGED_ENCRYPTION"
    kms_key_name    = "projects/my-project/locations/australia-southeast1/keyRings/my-ring/cryptoKeys/my-key"
  }
}
resource "google_spanner_instance" "c_instance" {
  name         = "test-instance-c"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C"
  num_nodes    = 1
}
resource "google_spanner_database" "c_database" {
  instance = google_spanner_instance.c_instance.name
  name     = "c-database"
}
