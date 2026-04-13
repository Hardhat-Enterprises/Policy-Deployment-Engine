resource "google_dataproc_metastore_service" "nc" {
  service_id = "nc"
  project    = 1

  scheduled_backup {
    backup_location = "invalid-location"
    enabled         = false
  }
}
