resource "google_composer_environment" "compliant_example_1" {
  name    = "compliant_example_1"
  project = "fake-project"
  region  = "australia-southeast1"
  config {
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}
