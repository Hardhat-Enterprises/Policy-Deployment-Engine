resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name     = "non-compliant-spoke"
  location = "global"
  hub      = "projects/unapproved-project/locations/global/hubs/unapproved-hub"

  linked_vpc_network {
    uri = "projects/unapproved-project/global/networks/unapproved-network"
  }
}