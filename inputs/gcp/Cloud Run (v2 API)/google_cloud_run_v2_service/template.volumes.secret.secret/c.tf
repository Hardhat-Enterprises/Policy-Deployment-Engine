resource "google_cloud_run_v2_service" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    volumes {
      name = "c"
      secret {
        secret = "projects/my-project/secrets/api-key"
      }
    }
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}