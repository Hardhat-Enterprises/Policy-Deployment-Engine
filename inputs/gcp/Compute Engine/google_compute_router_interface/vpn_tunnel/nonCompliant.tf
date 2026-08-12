resource "google_compute_router_interface" "non_compliant_example_1" {
  name       = "noncompliant-interface-1"
  router     = "router-1"
  vpn_tunnel = "unapproved-vpn-tunnel"
}
