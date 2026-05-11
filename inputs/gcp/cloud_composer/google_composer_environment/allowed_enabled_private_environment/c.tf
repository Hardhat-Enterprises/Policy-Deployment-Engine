resource "google_composer_environment" "c" {
  name    = "c"
  region  = "australia-southeast1"
  project = "fake-project"

  config {

    enable_private_environment = true
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}