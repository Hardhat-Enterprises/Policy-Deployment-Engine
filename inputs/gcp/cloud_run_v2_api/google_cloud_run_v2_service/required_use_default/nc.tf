resource "google_cloud_run_v2_service" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  binary_authorization {
    use_default = false
  }
  scaling {
    max_instance_count = 100
  }
  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}