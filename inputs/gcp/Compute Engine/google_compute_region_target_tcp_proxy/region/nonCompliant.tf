resource "google_compute_region_target_tcp_proxy" "non_compliant_example_1" {
  name            = "noncompliant-target-tcp-proxy"
  region          = "europe-west1"
  backend_service = "projects/fake-project/regions/europe-west1/backendServices/fake-backend"
}
