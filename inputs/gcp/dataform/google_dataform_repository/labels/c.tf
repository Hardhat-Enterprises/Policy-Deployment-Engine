# Google Dataform Repository — compliant labels (required labels)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "labels-compliant"
  display_name   = "c"
  
  labels = {
    environment   = "production"
    owner         = "data-team"
    cost_center   = "engineering"
    team          = "data-platform"
  }
}
