resource "google_compute_interconnect_attachment" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  region     = "australia-southeast1"
  encryption = "IPSEC"
}
