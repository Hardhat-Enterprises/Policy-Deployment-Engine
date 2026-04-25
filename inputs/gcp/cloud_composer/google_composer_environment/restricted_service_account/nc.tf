resource "google_composer_environment" "nc" {
  name    = "nc"
  project = "fake-project"
  region  = "us-central1"

  config {
    enable_private_environment = true
    enable_private_builds_only = true

    node_config {
      network         = "projects/my-project/global/networks/unapproved-network"
      service_account = "approved-sa@my-project.iam.gserviceaccount.com"
    }

    software_config {
      image_version = "composer-3-airflow-2"
    }
  }
}