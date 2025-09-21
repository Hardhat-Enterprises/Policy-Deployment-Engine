# Google Dataform Repository — non-compliant region (approved region allowlist)

resource "google_dataform_repository" "nc" {
  provider    = google-beta
  project     = var.project
  region      = "australia-southeast1"  # <-- fixed: changed to approved region
  name        = "nc"
  display_name = "nc"
}