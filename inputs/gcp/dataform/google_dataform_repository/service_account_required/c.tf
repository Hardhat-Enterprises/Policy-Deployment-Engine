# Google Dataform Repository — compliant service_account_required (explicit SA)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "service-account-compliant"
  display_name   = "c"
  service_account = "dataform-invoker@PROJECT.iam.gserviceaccount.com"
}

