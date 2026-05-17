resource "google_cloud_run_v2_service" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    volumes {
      name = "nc"
      secret {
        secret = "projects/untrusted-project/secrets/unknown-secret"
      }
    }
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}