resource "google_composer_environment" "c" {
  name    = "c"
  region  = "us-central1"
  project = "fake-project"

  config {
    enable_private_builds_only = true

    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}