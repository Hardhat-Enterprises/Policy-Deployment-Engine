resource "google_logging_project_bucket_config" "compliant_example_1" {
  project        = "my-project"
  location       = "global"
  retention_days = 90

  bucket_id = "compliant_example_1"
}
