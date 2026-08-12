resource "google_compute_network_attachment" "non_compliant_example_1" {
  name                   = "noncompliant-attachment-1"
  connection_preference  = "ACCEPT_MANUAL"
  subnetworks = [
    "projects/unapproved-project/regions/us-central1/subnetworks/unapproved-subnetwork"
  ]
}
