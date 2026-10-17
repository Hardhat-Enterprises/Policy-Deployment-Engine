resource "google_logging_project_bucket_config" "non_compliant_example_1" {
  project        = "my-project"
  location       = "global"
  retention_days = 15

  bucket_id = "non_compliant_example_1"
}
