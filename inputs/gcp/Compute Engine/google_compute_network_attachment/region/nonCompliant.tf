# Test that deployment outside the approved region is treated as non-compliant.

resource "google_compute_network_attachment" "non_compliant_example_1" {
  region = "us-central1"
}