resource "google_compute_network_peering" "compliant_example_1" {
  name                  = "compliant-example-1"
  network               = "projects/my-project/global/networks/my-network"
  peer_network          = "projects/my-project/global/networks/peer-network"
  export_custom_routes  = false
}