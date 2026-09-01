resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name     = "non-compliant-spoke"
  location = "global"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_producer_vpc_network {
    network = "projects/approved-network-project/global/networks/approved-consumer-vpc"
    peering = "unapproved-vpc-peering"
  }
}