resource "google_compute_vpn_tunnel" "compliant_example_1" {
  name          = "tunnel-compliant-1"
  peer_ip       = "15.0.0.120"
  target_vpn_gateway = "projects/fake-project/regions/us-central1/targetVpnGateways/fake-gateway"
  shared_secret = "Xq7#vT2wPz9$Lm4RbN8kEy6Hs1Ja0Cd"
}
