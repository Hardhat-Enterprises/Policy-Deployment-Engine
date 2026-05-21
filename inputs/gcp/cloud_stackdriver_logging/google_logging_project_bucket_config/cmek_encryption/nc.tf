# Non-compliant: No CMEK configured (uses Google-default encryption)
resource "google_logging_project_bucket_config" "nc" {
  project        = "my-project"
  location       = "global"
  retention_days = 90
  bucket_id      = "nc"

  # No cmek_settings block - uses Google-managed encryption
}