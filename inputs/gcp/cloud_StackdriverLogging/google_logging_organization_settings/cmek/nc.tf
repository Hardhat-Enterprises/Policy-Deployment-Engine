# Non-compliant: No CMEK key specified (uses Google-managed encryption)
resource "google_logging_organization_settings" "nc" {
  organization = "organizations/123456789012"

  # No kms_key_name - uses Google-managed encryption
  storage_location     = "global"
  disable_default_sink = false
}

# Non-compliant: Empty kms_key_name
resource "google_logging_organization_settings" "nc2" {
  organization = "organizations/123456789012"

  kms_key_name         = ""
  storage_location     = "global"
  disable_default_sink = false
}