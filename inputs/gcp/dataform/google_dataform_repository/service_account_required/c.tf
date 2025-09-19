# Google Dataform Repository — compliant (service_account_required: Service account configured)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "c"
  service_account = "dataform-service@my-test-project.iam.gserviceaccount.com"
}

variable "project" {
  type = string
}

