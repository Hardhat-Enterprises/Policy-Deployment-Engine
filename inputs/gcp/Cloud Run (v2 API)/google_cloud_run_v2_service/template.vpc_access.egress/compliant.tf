resource "google_cloud_run_v2_service" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
    vpc_access {
      egress = "PRIVATE_RANGES_ONLY"
    }
  }
}
