resource "google_dataproc_metastore_service" "compliant_example_1" {
  service_id = "compliant_example_1"
  project = 1

  scheduled_backup {
    backup_location = "gs://BUCKET_NAME/FOLDER_NAME/" # compliant example
    enabled         = true # default is false
  }
}
