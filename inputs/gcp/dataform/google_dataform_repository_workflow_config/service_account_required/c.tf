# Google Dataform Repository Workflow Config — compliant (service_account_required: service account set)

resource "google_dataform_repository" "repo_c" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "workflow-config-parent"
  display_name = "c"
}

resource "google_dataform_repository_release_config" "rel_c" {
  provider      = google-beta
  project       = var.project
  region        = google_dataform_repository.repo_c.region
  repository    = "projects/${var.project}/locations/${google_dataform_repository.repo_c.region}/repositories/${google_dataform_repository.repo_c.name}"
  name          = "default-release"
  git_commitish = "main"
  cron_schedule = "0 3 * * *"
}

resource "google_dataform_repository_workflow_config" "c" {
  provider      = google-beta
  project       = var.project
  region        = google_dataform_repository.repo_c.region
  repository    = "projects/${var.project}/locations/${google_dataform_repository.repo_c.region}/repositories/${google_dataform_repository.repo_c.name}"
  name          = "c"
  release_config = google_dataform_repository_release_config.rel_c.name

  invocation_config {
    service_account = "sa@project.iam.gserviceaccount.com"
  }
}



