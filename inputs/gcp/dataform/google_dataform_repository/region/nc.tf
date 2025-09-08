# Google Dataform Repository — non-compliant (region policy: not australia-southeast1)

resource "google_dataform_repository" "nc" {
  provider      = google-beta
  project       = var.project
  region        = "europe-west1"
  name          = "region-bad"
  display_name  = "dataform-noncompliant-region"
}
