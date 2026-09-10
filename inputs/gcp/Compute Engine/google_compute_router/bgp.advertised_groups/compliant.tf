resource "google_compute_router" "compliant_example_1" {
  name    = "compliant-advertised-groups-router"
  region  = "australia-southeast2"
  network = "default"

  bgp {
    asn               = 64514
    advertise_mode    = "CUSTOM"
    advertised_groups = []
  }
}