# Google Dataform Repository IAM — compliant (iam_no_public: no allUsers in members)

resource "google_dataform_repository" "repo_c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "iam-policy-parent"
  display_name = "dataform-repo-compliant-iam"
}

resource "google_dataform_repository_iam_binding" "c" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_c.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_c.region}/repositories/${google_dataform_repository.repo_c.name}"
  role       = "roles/viewer"
  members    = [
    "user:alice@example.com"
  ]
}


