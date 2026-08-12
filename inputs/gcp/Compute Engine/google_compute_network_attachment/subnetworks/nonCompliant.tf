# Test that an unapproved subnetwork is treated as non-compliant.

resource "google_compute_network_attachment" "non_compliant_example_1" {
  subnetworks = [
    "projects/unapproved-project/regions/us-central1/subnetworks/unapproved-subnetwork"
  ]
}