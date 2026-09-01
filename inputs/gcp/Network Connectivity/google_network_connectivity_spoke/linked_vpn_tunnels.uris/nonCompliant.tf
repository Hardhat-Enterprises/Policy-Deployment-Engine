resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name     = "non-compliant-spoke"
  location = "us-central1"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_vpn_tunnels {
    uris = [
      "projects/unapproved-project/regions/us-central1/vpnTunnels/unapproved-vpn-tunnel"
    ]

    site_to_site_data_transfer = false
  }
}