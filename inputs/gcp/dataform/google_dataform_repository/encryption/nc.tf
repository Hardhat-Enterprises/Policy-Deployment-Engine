# Google Dataform Repository — non-compliant (encryption: CMEK missing)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-noncompliant-encryption"
  display_name = "dataform-repository-noncompliant-encryption"
}

