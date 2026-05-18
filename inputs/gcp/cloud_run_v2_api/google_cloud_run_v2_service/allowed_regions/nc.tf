resource "google_cloud_run_v2_service" "nc" {
  name                = "nc"
  location            = "global"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  multi_region_settings {
    regions = ["us-central1", "europe-west1"]
  }

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}