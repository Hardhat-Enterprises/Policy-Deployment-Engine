resource "google_composer_environment" "non_compliant_example_1" {
  name            = "nc1"
  project         = "fake-project"
  region          = "us-central1"
  deletion_policy = "non_compliant_example_1"
  config {
    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}
