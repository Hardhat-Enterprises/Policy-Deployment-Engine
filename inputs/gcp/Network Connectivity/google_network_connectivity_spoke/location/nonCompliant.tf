resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name     = "non-compliant-spoke"
  location = "europe-west1"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_vpc_network {
    uri = "projects/unapproved-project/global/networks/unapproved-network"
  }
}