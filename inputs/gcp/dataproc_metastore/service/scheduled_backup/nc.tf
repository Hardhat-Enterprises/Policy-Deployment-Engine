resource "google_dataproc_metastore_service" "nc" {
  service_id = "_metastore-srv"
  project = 1

  scheduled_backup {
    backup_location = "invalid-location"  
    enabled         = false               
  }
}
