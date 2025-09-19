# Google Dataform Repository — non-compliant (service_account_required: Service account missing)

resource "google_dataform_repository" "nc" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "nc"
}


