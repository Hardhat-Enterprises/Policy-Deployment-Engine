resource "google_compute_router_peer" "non_compliant_example_1" {
  name      = "non-compliant-example-1"
  router    = "test-router"
  interface = "interface-1"
  peer_asn  = 65001
  project   = "smooth-verve-467716-v1"
  region    = "australia-southeast1"
}
