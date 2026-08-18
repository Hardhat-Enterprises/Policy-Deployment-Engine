resource "google_cloud_run_v2_service" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    volumes {
      name = "nc"
      gcs {
        bucket    = "my-secure-bucket"
        read_only = false
      }
    }
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}
