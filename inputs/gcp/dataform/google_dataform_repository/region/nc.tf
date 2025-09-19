# Google Dataform Repository — non-compliant (region allow-list: unapproved region)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "europe-west1"
  name         = "dataform-repo-noncompliant-region"
  display_name = "dataform-repository-noncompliant-region"
}

