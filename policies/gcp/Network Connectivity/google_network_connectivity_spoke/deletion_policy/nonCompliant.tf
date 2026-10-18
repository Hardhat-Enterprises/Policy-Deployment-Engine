resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name            = "non-compliant-spoke"
  location        = "global"
  deletion_policy = "DELETE"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_vpc_network {
    uri = "projects/approved-network-project/global/networks/approved-network"
  }
}