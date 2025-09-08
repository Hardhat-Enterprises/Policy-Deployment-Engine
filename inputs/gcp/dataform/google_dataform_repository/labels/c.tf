# Google Dataform Repository — compliant (labels policy: required labels present)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "us-central1"
  name           = "labels-good"
  display_name   = "dataform-compliant-labels"

  labels = {
    environment = "dev"
    owner       = "team-a"
    cost_center = "cc-1234"
    team        = "data-platform"
  }
}


