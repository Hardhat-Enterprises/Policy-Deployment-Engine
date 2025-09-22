# Google Dataform Repository IAM — non-compliant (iam_no_public: public principals present)

resource "google_dataform_repository" "repo_nc" {
  provider     = google-beta
  project      = var.project
  region       = "us-central1"
  name         = "nc"
  display_name = "nc"
}

resource "google_dataform_repository_iam_binding" "nc" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_nc.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_nc.region}/repositories/${google_dataform_repository.repo_nc.name}"

  role    = "roles/viewer"
  members = [
    "user:bob@example.com",
    "allUsers"  # Public access - non-compliant for testing policy enforcement
  ]
}