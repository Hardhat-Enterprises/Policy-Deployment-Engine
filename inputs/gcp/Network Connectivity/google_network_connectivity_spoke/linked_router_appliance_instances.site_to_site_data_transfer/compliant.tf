resource "google_network_connectivity_spoke" "compliant_example_1" {
  name     = "compliant-spoke"
  location = "us-central1"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_router_appliance_instances {
    instances {
      virtual_machine = "projects/approved-network-project/zones/us-central1-a/instances/approved-router-appliance"
      ip_address      = "10.0.0.2"
    }

    site_to_site_data_transfer = false
  }
}