resource "google_compute_router_interface" "compliant_example_1" {
  name       = "compliant-interface-1"
  router     = "router-1"
  vpn_tunnel = "approved-vpn-tunnel"
}
