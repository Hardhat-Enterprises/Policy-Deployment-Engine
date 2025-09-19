# Google Dataform Repository Workflow Config — compliant (service_account_required: service account defined)

resource "google_dataform_repository" "repo" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-workflow-config"
  display_name = "dataform-repository-workflow-config"
}

resource "google_dataform_repository_release_config" "release" {
  provider      = google-beta
  project       = var.project
  region        = "australia-southeast1"
  repository    = google_dataform_repository.repo.name
  name          = "dataform-release-workflow"
  git_commitish = "main"
}

resource "google_dataform_repository_workflow_config" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  repository     = google_dataform_repository.repo.name
  name           = "dataform-workflow-compliant-sa"
  release_config = google_dataform_repository_release_config.release.name
  
  invocation_config {
    service_account = "dataform-workflow@my-project.iam.gserviceaccount.com"
  }
}

variable "project" {
  type = string
}
