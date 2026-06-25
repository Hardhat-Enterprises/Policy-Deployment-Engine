resource "google_dataproc_metastore_service" "non_compliant_example_1" {
  service_id = "non_compliant_example_1"
  project = 1

  scheduled_backup {
    backup_location = "invalid-location"  
    enabled         = false               
  }
}
