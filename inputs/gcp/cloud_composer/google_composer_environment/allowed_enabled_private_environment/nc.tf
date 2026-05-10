resource "google_composer_environment" "nc" {
  name    = "nc"
  region  = "us-central1"
  project = "fake-project"

  config {

    enable_private_environment = false
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}