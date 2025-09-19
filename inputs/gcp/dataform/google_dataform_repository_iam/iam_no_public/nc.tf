# Google Dataform Repository IAM — non-compliant (iam_no_public: allUsers present)

resource "google_dataform_repository" "repo_nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-iam-noncompliant"
  display_name = "dataform-repository-iam-noncompliant"
}

resource "google_dataform_repository_iam_binding" "nc" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_nc.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_nc.region}/repositories/${google_dataform_repository.repo_nc.name}"
  role       = "roles/viewer"
  members    = [
    "allUsers"
  ]
}

