resource "google_compute_vpn_tunnel" "non_compliant_example_1" {
  name          = "tunnel-noncompliant-1"
  peer_ip       = "15.0.0.120"
  shared_secret = "a secret message"
  target_vpn_gateway = "fake-gateway"
  region = "us-central1"
}
