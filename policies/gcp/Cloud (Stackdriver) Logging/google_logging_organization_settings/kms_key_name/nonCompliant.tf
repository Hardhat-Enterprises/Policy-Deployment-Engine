# Non-compliant: No CMEK key specified
resource "google_logging_organization_settings" "non_compliant_example_1" {
  organization         = "non_compliant_example_1"
  storage_location     = "global"
  disable_default_sink = false
}

# Non-compliant: Empty kms_key_name
resource "google_logging_organization_settings" "non_compliant_example_2" {
  organization         = "non_compliant_example_2"
  kms_key_name         = ""
  storage_location     = "us-central1"
  disable_default_sink = false
}
