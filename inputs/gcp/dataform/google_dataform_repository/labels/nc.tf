# Google Dataform Repository — non-compliant (labels: Missing required labels)

resource "google_dataform_repository" "nc" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "nc"
  
  labels = {
    environment = ""
    owner       = "team-data"
  }
}

