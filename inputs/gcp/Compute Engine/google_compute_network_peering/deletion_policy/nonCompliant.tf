resource "google_compute_network_peering" "non_compliant_example_1" {
  name         = "non-compliant-example-1"
  network      = "projects/my-project/global/networks/my-network"
  peer_network = "projects/my-project/global/networks/peer-network"
  deletion_policy = "DELETE"
}