# Google Dataform Repository IAM — compliant (iam_no_public: no public principals)

resource "google_dataform_repository" "repo_c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "c"
  display_name = "c"
}

resource "google_dataform_repository_iam_binding" "c" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_c.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_c.region}/repositories/${google_dataform_repository.repo_c.name}"

  role = "roles/dataform.viewer"
  members = [
    "user:alice@example.com"
  ]
}