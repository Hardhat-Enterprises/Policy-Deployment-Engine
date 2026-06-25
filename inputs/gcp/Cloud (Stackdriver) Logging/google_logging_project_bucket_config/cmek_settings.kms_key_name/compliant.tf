# Compliant: Uses CMEK encryption with valid key
resource "google_logging_project_bucket_config" "compliant_example_1" {
  project        = "my-project"
  location       = "global"
  retention_days = 90
  bucket_id      = "compliant_example_1"

  cmek_settings {
    kms_key_name = "c"
  }
}
