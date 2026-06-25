resource "google_cloud_run_v2_service" "compliant_example_1" {
  name                = "compliant_example_1"
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
