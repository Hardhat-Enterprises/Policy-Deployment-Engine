# Google Dataform Repository — non-compliant labels (required labels)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "labels-non-compliant"
  display_name   = "nc"
  
  labels = {
    environment   = "production"
    owner         = "data-team"
    cost_center   = ""
    team          = "data-platform"
  }
}
