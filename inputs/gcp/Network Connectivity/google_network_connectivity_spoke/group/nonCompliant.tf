resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name     = "non-compliant-spoke"
  location = "global"

  hub   = "projects/approved-network-project/locations/global/hubs/approved-hub"
  group = "projects/approved-network-project/locations/global/hubs/approved-hub/groups/unapproved-group"

  linked_vpc_network {
    uri = "projects/unapproved-project/global/networks/unapproved-network"
  }
}