# Google Dataform Repository IAM — non-compliant (binding includes public members)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "us-central1"
  name           = "iam-bad"
  display_name   = "dataform-iam-base-nc"
}

resource "google_dataform_repository_iam_binding" "nc" {
  provider  = google-beta
  project    = var.project
  region     = "us-central1"
  repository = google_dataform_repository.nc.name
  role       = "roles/viewer"
  members    = [
    "allUsers"
  ]
}


