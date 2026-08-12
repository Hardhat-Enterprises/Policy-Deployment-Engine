resource "google_compute_router_interface" "compliant_example_1" {
  name            = "compliant-interface-1"
  router          = "router-1"
  ip_range        = "169.254.1.1/30"
  deletion_policy = "DELETE"
}
