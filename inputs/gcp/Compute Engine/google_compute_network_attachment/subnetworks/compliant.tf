# Test that only an approved subnetwork is used.

resource "google_compute_network_attachment" "compliant_example_1" {
  subnetworks = [
    "projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork"
  ]
}