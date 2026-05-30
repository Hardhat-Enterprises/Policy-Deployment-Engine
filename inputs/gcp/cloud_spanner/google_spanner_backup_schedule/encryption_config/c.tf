resource "google_spanner_backup_schedule" "c" {
  instance           = "c-instance"
  database           = "c-database"
  name               = "c"
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
