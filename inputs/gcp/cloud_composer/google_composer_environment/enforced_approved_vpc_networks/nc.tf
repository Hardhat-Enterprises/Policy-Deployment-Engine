resource "google_composer_environment" "nc" {
  name    = "nc"
  region  = "us-central1"
  project = "fake-project"
  config {
    enable_private_environment = true
    enable_private_builds_only = true

    node_config {
      network = "projects/my-project/global/networks/unapproved-network"
    }

    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}