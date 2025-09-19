# Google Dataform Repository — non-compliant (git_required: Git integration missing)

resource "google_dataform_repository" "nc" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "nc"
}


