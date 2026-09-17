resource "google_compute_network_attachment" "non_compliant_example_1" {
  name                  = "noncompliant-attachment-1"
  region                = "australia-southeast1"
  connection_preference = "ACCEPT_MANUAL"
  subnetworks           = ["invalid-subnetwork"]
  producer_accept_lists = ["approved-project-123"]
  deletion_policy       = "PREVENT"
}
