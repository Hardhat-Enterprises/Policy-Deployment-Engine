# Google Dataform Repository Release Config — non-compliant (cron_required: schedule missing)

resource "google_dataform_repository" "repo_nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "dataform-repo-release-config-nc"
  display_name = "dataform-repository-release-config-nc"
}

resource "google_dataform_repository_release_config" "nc" {
  provider      = google-beta
  project       = var.project
  region        = "australia-southeast1"
  repository    = google_dataform_repository.repo_nc.name
  name          = "dataform-release-noncompliant-cron"
  git_commitish = "main"
}

