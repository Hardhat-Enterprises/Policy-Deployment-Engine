resource "google_compute_router_interface" "non_compliant_example_1" {
  name     = "noncompliant-interface-1"
  router   = "router-1"
  ip_range = "169.254.1.1/30"
  region   = "us-central1"
}
