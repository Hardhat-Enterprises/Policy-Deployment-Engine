# Google Dataform Repository — non-compliant (encryption policy: kms_key_name is missing)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "us-central1"
  name           = "cmek-bad"
  display_name   = "dataform-noncompliant-encryption"
  kms_key_name   = ""
}


