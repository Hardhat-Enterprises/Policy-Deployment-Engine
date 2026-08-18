# Compliant: Bucket is locked
resource "google_logging_project_bucket_config" "compliant_example_1" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "compliant_example_1"
  retention_days = 400
  locked         = true
  description    = "Compliant locked bucket for audit logs"
}

# Compliant: _Required bucket is locked by default
resource "google_logging_project_bucket_config" "compliant_example_2" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "compliant_example_2"
  retention_days = 400
  locked         = true
}
