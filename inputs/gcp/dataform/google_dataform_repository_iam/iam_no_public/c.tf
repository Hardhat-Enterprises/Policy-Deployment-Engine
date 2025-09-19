# Google Dataform Repository IAM — compliant (iam_no_public: no allUsers in members)

resource "google_dataform_repository" "repo_c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-iam-compliant"
  display_name = "dataform-repository-iam-compliant"
}

resource "google_dataform_repository_iam_binding" "c" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_c.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_c.region}/repositories/${google_dataform_repository.repo_c.name}"
  role       = "roles/dataform.viewer"
  members    = [
    "user:alice@example.com"
  ]
}

variable "project" {
  type = string
}
