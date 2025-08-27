# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  project = 1

  scheduled_backup {
    backup_location = "gs://metastore-backup-123" # compliant example
    enabled         = false # default is false
  }
}
