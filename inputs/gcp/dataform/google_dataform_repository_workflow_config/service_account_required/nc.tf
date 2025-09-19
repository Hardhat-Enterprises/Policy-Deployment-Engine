# Google Dataform Repository Workflow Config — non-compliant (service_account_required: service account missing)

resource "google_dataform_repository" "repo_nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-workflow-config-nc"
  display_name = "dataform-repository-workflow-config-nc"
}

resource "google_dataform_repository_release_config" "release_nc" {
  provider      = google-beta
  project       = var.project
  region        = "australia-southeast1"
  repository    = google_dataform_repository.repo_nc.name
  name          = "dataform-release-workflow-nc"
  git_commitish = "main"
}

resource "google_dataform_repository_workflow_config" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  repository     = google_dataform_repository.repo_nc.name
  name           = "dataform-workflow-noncompliant-sa"
  release_config = google_dataform_repository_release_config.release_nc.name
}

