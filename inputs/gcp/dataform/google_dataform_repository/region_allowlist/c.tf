# Google Dataform Repository — compliant region (approved region allowlist)

resource "google_dataform_repository" "c" {
  provider     = google-beta
  region       = "australia-southeast1"
  name         = "c"
  display_name = "c"
}