# Non-compliant: No CMEK key specified
resource "google_logging_organization_settings" "nc1" {
  organization         = "nc1"
  storage_location     = "global"
  disable_default_sink = false
}

# Non-compliant: Empty kms_key_name
resource "google_logging_organization_settings" "nc2" {
  organization         = "nc2"
  kms_key_name         = ""
  storage_location     = "global"
  disable_default_sink = false
}