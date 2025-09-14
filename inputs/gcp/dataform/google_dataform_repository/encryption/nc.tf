# Google Dataform Repository — non-compliant encryption (CMEK required)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "cmek-non-compliant"
  display_name   = "nc"
  kms_key_name   = ""
}
