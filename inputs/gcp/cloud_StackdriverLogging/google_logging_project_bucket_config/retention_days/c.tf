resource "google_logging_project_bucket_config" "c" {
  project        = "my-project"
  location       = "global"
  retention_days = 90

  bucket_id = "audit-bucket"
}