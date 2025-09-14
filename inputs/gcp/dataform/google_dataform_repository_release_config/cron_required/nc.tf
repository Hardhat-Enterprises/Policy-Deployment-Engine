# Google Dataform Repository Release Config — non-compliant (cron_required: cron_schedule missing)

resource "google_dataform_repository" "repo_nc" {
  provider     = google-beta
  project      = var.project
  region       = "us-central1"
  name         = "release-config-parent-nc"
  display_name = "nc"
}

resource "google_dataform_repository_release_config" "nc" {
  provider      = google-beta
  project       = var.project
  region        = google_dataform_repository.repo_nc.region
  repository    = "projects/${var.project}/locations/${google_dataform_repository.repo_nc.region}/repositories/${google_dataform_repository.repo_nc.name}"
  name          = "nc"
  git_commitish = "main"
  # cron_schedule intentionally omitted to fail policy
}



