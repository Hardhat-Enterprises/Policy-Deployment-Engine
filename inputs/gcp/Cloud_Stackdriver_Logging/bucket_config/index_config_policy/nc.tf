resource "google_logging_project_bucket_config" "nc" {
  project        = "gdce-dev"
  location       = "global"
  bucket_id      = "nc"
  
  index_configs {
    field_path = "random_fields"
    type       = "INDEX_TYPE_STRING"
  }

  index_configs {
    field_path = "another_field"
    type       = "INDEX_TYPE_STRING"
  }

  index_configs {
    field_path = "severity"
    type       = "INVALID_TYPE"  # Non-standard type
  }
}