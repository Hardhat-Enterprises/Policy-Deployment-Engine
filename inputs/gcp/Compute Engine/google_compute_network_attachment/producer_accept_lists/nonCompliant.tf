resource "google_compute_network_attachment" "non_compliant_example_1" {
  name                   = "noncompliant-attachment-1"
  connection_preference  = "ACCEPT_MANUAL"
  subnetworks = [
    "projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork"
  ]
  producer_accept_lists = [
    "unapproved-project-123",
    "unapproved-project-456"
  ]
}
