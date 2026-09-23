resource "google_compute_network_attachment" "non_compliant_example_1" {
  name                   = "noncompliant-attachment-1"
  connection_preference  = "ACCEPT_MANUAL"
  region                 = "us-central1"
  subnetworks = [
    "projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork"
  ]
}
