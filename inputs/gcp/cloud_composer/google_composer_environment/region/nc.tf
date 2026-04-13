resource "google_composer_environment" "nc" {
  name    = "nc"
  project = "fake-project"
  region  = "australia-southeast2"
  config {
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}