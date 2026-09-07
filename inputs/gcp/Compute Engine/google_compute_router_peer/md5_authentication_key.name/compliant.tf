resource "google_compute_router_peer" "compliant_example_1" {
  name      = "compliant-example-1"
  router    = "test-router"
  interface = "interface-1"
  peer_asn  = 65001
  project   = "smooth-verve-467716-v1"
  region    = "australia-southeast1"

  md5_authentication_key {
    name = "bgp-md5-key-1"
    key  = "dummy-test-key"
  }
}
