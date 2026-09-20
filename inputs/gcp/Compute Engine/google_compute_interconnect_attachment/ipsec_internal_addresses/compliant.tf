resource "google_compute_interconnect_attachment" "compliant_example_1" {
  name       = "compliant-example-1"
  region     = "australia-southeast1"
  encryption = "IPSEC"
  ipsec_internal_addresses = [
    "projects/p/regions/australia-southeast1/addresses/vpn-range-1"]
}
