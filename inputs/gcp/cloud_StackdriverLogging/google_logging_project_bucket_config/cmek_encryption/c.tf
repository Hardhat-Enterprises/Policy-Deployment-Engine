# Compliant: Uses CMEK encryption with valid key
resource "google_logging_project_bucket_config" "c" {
  project        = "my-project"
  location       = "global"
  retention_days = 90
  bucket_id      = "secure-audit-bucket"

  cmek_settings {
    kms_key_name = "projects/my-project/locations/global/keyRings/logging-keyring/cryptoKeys/logging-key"
  }
}