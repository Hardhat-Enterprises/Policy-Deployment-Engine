resource "google_compute_router" "non_compliant_example_1" {
  name    = "noncompliant-md5-router"
  region  = "australia-southeast2"
  network = "default"

  bgp {
    asn = 64514
  }

  md5_authentication_keys {
    name = "peer-key-1"
    key  = "changeme"
  }
}