resource "google_compute_router" "compliant_example_1" {
  name    = "compliant-advertised-range-router"
  region  = "australia-southeast2"
  network = "default"

  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"

    advertised_ip_ranges {
      range = "10.0.1.0/24"
    }
  }
}