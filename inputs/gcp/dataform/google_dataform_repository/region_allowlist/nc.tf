# Google Dataform Repository — non-compliant region (approved region allowlist)

resource "google_dataform_repository" "nc" {
  provider    = google-beta
  project     = var.project
  region      = "europe-west1"
  name        = "nc"
  display_name = "dataform-repo-noncompliant-region_allowlist"
}