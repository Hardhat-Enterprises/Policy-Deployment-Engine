resource "google_compute_vpn_tunnel" "compliant_example_1" {
  name          = "tunnel-compliant-1"
  peer_ip       = "15.0.0.120"
  shared_secret = "a secret message"
  target_vpn_gateway = "projects/fake-project/regions/australia-southeast1/targetVpnGateways/fake-gateway"
  region = "australia-southeast1"
}
