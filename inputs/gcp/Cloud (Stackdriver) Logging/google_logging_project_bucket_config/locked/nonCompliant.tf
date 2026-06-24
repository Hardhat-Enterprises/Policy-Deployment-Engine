# Non-compliant: Bucket not locked
resource "google_logging_project_bucket_config" "non_compliant_example_1" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "non_compliant_example_1"
  retention_days = 90
  description    = "Non-compliant: bucket not locked"
}

# Non-compliant: Explicitly set locked = false
resource "google_logging_project_bucket_config" "non_compliant_example_2" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "non_compliant_example_2"
  retention_days = 90
  locked         = false
  description    = "Non-compliant: explicitly unlocked"
}
