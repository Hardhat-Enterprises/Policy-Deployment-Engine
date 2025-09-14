resource "google_logging_project_bucket_config" "c" {
  project        = "gdce-dev"
  location       = "global"
  bucket_id      = "c"
  
  index_configs {
    field_path = "severity"
    type       = "INDEX_TYPE_STRING"
  }

  index_configs {
    field_path = "resource.type"
    type       = "INDEX_TYPE_STRING"
  }

  index_configs {
    field_path = "protoPayload.methodName"
    type       = "INDEX_TYPE_STRING"
  }
}