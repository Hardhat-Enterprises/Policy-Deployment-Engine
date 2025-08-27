# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dataproc_metastore_service" "nc" {
  service_id = "_metastore-srv"
  project = 1

  scheduled_backup {
    backup_location = "invalid-location"  # non-compliant: not a gs:// URI
    enabled         = true                # non-compliant for your rule
  }
}
