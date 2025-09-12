# Google Dataform Repository — compliant (region policy: australia-southeast1)

resource "google_dataform_repository" "c" {
  provider      = google-beta
  project       = var.project
  region        = "australia-southeast1"
  name          = "region-good"
  display_name  = "dataform-compliant-region"
}
