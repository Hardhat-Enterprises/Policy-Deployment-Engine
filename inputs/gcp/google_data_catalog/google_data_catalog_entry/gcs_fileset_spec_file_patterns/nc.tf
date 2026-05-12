resource "google_data_catalog_entry" "nc" {
  entry_group = "approved_entry_group"
  entry_id    = "my_entry"

  type = "FILESET"

  gcs_fileset_spec {
    file_patterns = ["gs://other_bucket/file"]
  }
}
