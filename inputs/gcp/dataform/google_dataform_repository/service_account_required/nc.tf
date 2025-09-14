# Google Dataform Repository — non-compliant service_account_required (explicit SA)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "service-account-non-compliant"
  display_name   = "nc"
  service_account = ""
}

