# Google Dataform Repository Release Config — compliant (cron_required: cron_schedule set)

resource "google_dataform_repository" "repo_c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "release-config-parent"
  display_name = "c"
}

resource "google_dataform_repository_release_config" "c" {
  provider   = google-beta
  project    = var.project
  region     = google_dataform_repository.repo_c.region
  repository = "projects/${var.project}/locations/${google_dataform_repository.repo_c.region}/repositories/${google_dataform_repository.repo_c.name}"

  name          = "c"
  git_commitish = "main"
  cron_schedule = "0 2 * * *"
}