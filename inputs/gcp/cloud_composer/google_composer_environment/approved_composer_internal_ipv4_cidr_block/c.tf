resource "google_composer_environment" "c" {
  name    = "c"
  region  = "us-central1"
  project = "fake-project"

  config {
    enable_private_environment = true

    node_config {
      network                           = "projects/my-project/global/networks/approved-network-1"
      composer_internal_ipv4_cidr_block = "10.0.0.0/20"
    }

    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}