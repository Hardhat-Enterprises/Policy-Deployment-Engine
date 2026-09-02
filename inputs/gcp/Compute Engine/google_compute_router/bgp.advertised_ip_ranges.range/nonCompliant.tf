resource "google_compute_router" "non_compliant_example_1" {
  name    = "noncompliant-advertised-range-router"
  region  = "australia-southeast2"
  network = "default"

  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"

    advertised_ip_ranges {
      range = "0.0.0.0/0"
    }
  }
}