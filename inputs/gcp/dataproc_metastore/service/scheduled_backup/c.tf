resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  project = 1

  scheduled_backup {
    backup_location = "gs://BUCKET_NAME/FOLDER_NAME/" # compliant example
    enabled         = true # default is false
  }
}
