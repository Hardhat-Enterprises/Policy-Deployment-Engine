# Google Dataform Repository — non-compliant (labels policy: required labels missing)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "us-central1"
  name           = "labels-bad"
  display_name   = "dataform-noncompliant-labels"

  labels = {}
}


