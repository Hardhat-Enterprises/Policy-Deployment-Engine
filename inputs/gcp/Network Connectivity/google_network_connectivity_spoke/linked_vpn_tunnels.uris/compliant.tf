resource "google_network_connectivity_spoke" "compliant_example_1" {
  name     = "compliant-spoke"
  location = "us-central1"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_vpn_tunnels {
    uris = [
      "projects/approved-network-project/regions/us-central1/vpnTunnels/approved-vpn-tunnel"
    ]

    site_to_site_data_transfer = false
  }
}