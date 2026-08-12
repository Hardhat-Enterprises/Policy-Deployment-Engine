# Test that the resource is deployed in an approved region.

resource "google_compute_network_attachment" "compliant_example_1" {
  region = "australia-southeast1"
}