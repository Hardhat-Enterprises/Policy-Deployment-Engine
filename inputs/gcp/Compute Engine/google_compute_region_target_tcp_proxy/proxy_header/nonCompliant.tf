resource "google_compute_region_target_tcp_proxy" "non_compliant_example_1" {
  name            = "noncompliant-target-tcp-proxy"
  region          = "us-central1"
  backend_service = "projects/fake-project/regions/us-central1/backendServices/fake-backend"
  proxy_header    = "NONE"
}
