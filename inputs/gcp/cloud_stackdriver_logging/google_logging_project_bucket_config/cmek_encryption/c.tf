# Compliant: Uses CMEK encryption with valid key
resource "google_logging_project_bucket_config" "c" {
  project        = "my-project"
  location       = "global"
  retention_days = 90
  bucket_id      = "c"

  cmek_settings {
    kms_key_name = "c"
  }
}