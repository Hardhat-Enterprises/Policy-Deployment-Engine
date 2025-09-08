# Google Dataform Repository IAM — compliant (no public members in bindings)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "us-central1"
  name           = "iam-good"
  display_name   = "dataform-iam-base"
}

resource "google_dataform_repository_iam_binding" "c" {
  provider  = google-beta
  project    = var.project
  region     = "us-central1"
  repository = google_dataform_repository.c.name
  role       = "roles/viewer"
  members    = [
    "user:dev@example.com"
  ]
}


