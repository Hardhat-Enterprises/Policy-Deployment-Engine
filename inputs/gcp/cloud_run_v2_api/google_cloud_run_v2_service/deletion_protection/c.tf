resource "google_cloud_run_v2_service" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}