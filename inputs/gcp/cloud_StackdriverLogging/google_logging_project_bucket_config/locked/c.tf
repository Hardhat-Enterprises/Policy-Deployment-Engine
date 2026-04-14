# Compliant: Bucket is locked
resource "google_logging_project_bucket_config" "c" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "locked-audit-bucket"
  retention_days = 400
  locked         = true

  description = "Compliant locked bucket for audit logs"
}

# Compliant: _Required bucket is locked by default
resource "google_logging_project_bucket_config" "c2" {
  project        = "my-project"
  location       = "global"
  bucket_id      = "_Required"
  retention_days = 400
  locked         = true
}