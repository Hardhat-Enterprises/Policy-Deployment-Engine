resource "google_cloud_run_v2_service" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  invoker_iam_disabled = false

  template {
    service_account = ""
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}
