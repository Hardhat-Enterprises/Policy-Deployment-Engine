resource "google_composer_environment" "c" {
  name    = "c"
  project = "fake-project"
  region  = "australia-southeast1"

  config {
    enable_private_environment = true
    enable_private_builds_only = true

    node_config {
      network         = "projects/my-project/global/networks/approved-network-1"
      service_account = "unauthorized-sa@my-project.iam.gserviceaccount.com"
    }

    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}