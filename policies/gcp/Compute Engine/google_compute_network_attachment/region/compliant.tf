resource "google_compute_network_attachment" "compliant_example_1" {
  name                   = "compliant-attachment-1"
  connection_preference  = "ACCEPT_MANUAL"
  region                 = "australia-southeast1"
  subnetworks = [
    "projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork"
  ]
}
