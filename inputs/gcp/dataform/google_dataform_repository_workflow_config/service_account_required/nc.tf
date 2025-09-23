# Google Dataform Repository Workflow Config — non-compliant (service_account_required: missing service account)

resource "google_dataform_repository" "repo_nc" {
  provider     = google-beta
  project      = var.project
  region       = "us-central1"
  name         = "nc"
  display_name = "nc"
}

resource "google_dataform_repository_release_config" "rel_nc" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_nc.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_nc.region}/repositories/${google_dataform_repository.repo_nc.name}"

  name          = "nc"
  git_commitish = "main"
  cron_schedule = "0 3 * * *"
}

resource "google_dataform_repository_workflow_config" "nc" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_nc.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_nc.region}/repositories/${google_dataform_repository.repo_nc.name}"
  name       = "nc"

  release_config = google_dataform_repository_release_config.rel_nc.name

  # invocation_config block with missing service account - non-compliant for testing policy enforcement
  invocation_config {
    # service_account not set - non-compliant for testing policy enforcement
  }
}