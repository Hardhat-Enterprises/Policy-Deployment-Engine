resource "google_cloud_run_v2_service" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    encryption_key = "projects/my-project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-key"

    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}