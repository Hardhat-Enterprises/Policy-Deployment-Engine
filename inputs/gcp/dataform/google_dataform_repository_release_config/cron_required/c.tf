# Google Dataform Repository Release Config — compliant (cron_required: schedule defined)

resource "google_dataform_repository" "repo" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-release-config"
  display_name = "dataform-repository-release-config"
}

resource "google_dataform_repository_release_config" "c" {
  provider        = google-beta
  project         = var.project
  region          = "australia-southeast1"
  repository      = google_dataform_repository.repo.name
  name            = "dataform-release-compliant-cron"
  git_commitish   = "main"
  cron_schedule   = "0 2 * * *"
}

variable "project" {
  type = string
}
