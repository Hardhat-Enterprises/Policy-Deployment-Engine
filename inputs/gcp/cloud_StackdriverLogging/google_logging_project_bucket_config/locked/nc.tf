# Non-compliant: Bucket not locked (defaults to false)
resource "google_logging_project_bucket_config" "nc" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "unlocked-bucket"
  retention_days = 90
  # locked omitted - defaults to false

  description = "Non-compliant: bucket not locked"
}

# Non-compliant: Explicitly set locked = false
resource "google_logging_project_bucket_config" "nc2" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "explicit-unlocked"
  retention_days = 90
  locked         = false

  description = "Non-compliant: explicitly unlocked"
}