# Compliant: Bucket is locked
resource "google_logging_project_bucket_config" "c1" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "c1"
  retention_days = 400
  locked         = true
  description    = "Compliant locked bucket for audit logs"
}

# Compliant: _Required bucket is locked by default
resource "google_logging_project_bucket_config" "c2" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "c2"
  retention_days = 400
  locked         = true
}