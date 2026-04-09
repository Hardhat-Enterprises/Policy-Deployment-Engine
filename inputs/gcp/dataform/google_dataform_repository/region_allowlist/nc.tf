# Google Dataform Repository — non-compliant region (approved region allowlist)

resource "google_dataform_repository" "nc" {
  provider    = google-beta
  region      = "us-central1"  # Non-approved region for testing policy enforcement
  name        = "nc"
  display_name = "nc"
}