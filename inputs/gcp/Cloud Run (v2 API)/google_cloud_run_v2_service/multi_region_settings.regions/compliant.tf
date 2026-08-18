resource "google_cloud_run_v2_service" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "global"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  multi_region_settings {
    regions = ["australia-southeast1", "australia-southeast2"]
  }

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}
