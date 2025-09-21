# Google Dataform Repository — non-compliant encryption (CMEK required)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"

  # kms_key_name not set - non-compliant for testing policy enforcement
}