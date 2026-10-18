resource "google_composer_environment" "compliant_example_1" {
  name            = "c1"
  project         = "fake-project"
  region          = "australia-southeast1"
  deletion_policy = "compliant_example_1"
  config {
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}
