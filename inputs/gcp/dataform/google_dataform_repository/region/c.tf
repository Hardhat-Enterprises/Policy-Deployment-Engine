# Google Dataform Repository — compliant (region allow-list: approved region)

resource "google_dataform_repository" "c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-compliant-region"
  display_name = "dataform-repository-compliant-region"
}

