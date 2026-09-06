resource "google_compute_network_attachment" "compliant_example_1" {
  name                  = "compliant-attachment-1"
  connection_preference = "ACCEPT_MANUAL"
  subnetworks = [
    "projects/project-1/regions/australia-southeast1/subnetworks/subnetwork-1"
  ]
}
