resource "google_cloud_run_v2_service" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  invoker_iam_disabled = false

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}