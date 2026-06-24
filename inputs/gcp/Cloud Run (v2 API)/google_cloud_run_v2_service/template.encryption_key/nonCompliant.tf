resource "google_cloud_run_v2_service" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    encryption_key = "projects/my-project/locations/us-central1/keyRings/random-keys/cryptoKeys/random-key"

    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}
