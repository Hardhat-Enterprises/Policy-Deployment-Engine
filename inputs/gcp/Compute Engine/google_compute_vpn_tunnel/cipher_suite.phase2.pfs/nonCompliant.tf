resource "google_compute_vpn_tunnel" "non_compliant_example_1" {
  name          = "tunnel-noncompliant-1"
  peer_ip       = "15.0.0.120"
  shared_secret = "a secret message"
  target_vpn_gateway = "projects/fake-project/regions/us-central1/targetVpnGateways/fake-gateway"
  cipher_suite {
    phase2 { pfs = ["Group-2"] }
  }
}
