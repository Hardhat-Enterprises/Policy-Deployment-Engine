# Google Dataform Repository — compliant region (approved region allowlist)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "region-compliant"
  display_name   = "c"
}
