resource "google_compute_router" "non_compliant_example_1" {
  name    = "noncompliant-advertise-mode-router"
  region  = "australia-southeast2"
  network = "default"

  bgp {
    asn           = 64514
    advertise_mode = "DEFAULT"
  }
}