resource "google_composer_environment" "nc" {
  name    = "nc"
  project = "fake-project"
  region  = "us-central1"
  config {
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}