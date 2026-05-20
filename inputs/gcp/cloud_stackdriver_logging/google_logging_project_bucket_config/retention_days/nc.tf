resource "google_logging_project_bucket_config" "nc" {
  project        = "my-project"
  location       = "global"
  retention_days = 15

  bucket_id = "nc"
}