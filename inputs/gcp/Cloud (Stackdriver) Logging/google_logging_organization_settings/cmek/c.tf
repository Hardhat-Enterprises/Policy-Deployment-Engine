# Compliant: Uses CMEK encryption
resource "google_logging_organization_settings" "c1" {
  organization         = "c1"
  kms_key_name         = "projects/security-project/locations/global/keyRings/org-logging-keyring/cryptoKeys/org-audit-key"
  storage_location     = "global"
  disable_default_sink = false
}

# Compliant: Uses CMEK in a specific region
resource "google_logging_organization_settings" "c2" {
  organization         = "c2"
  kms_key_name         = "projects/security-project/locations/us-central1/keyRings/org-logging-ring/cryptoKeys/audit-key"
  storage_location     = "us-central1"
  disable_default_sink = false
}