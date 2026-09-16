resource "google_network_connectivity_spoke" "compliant_example_1" {
  name            = "compliant-spoke"
  project         = "example-project"
  location        = "us-central1"
  hub             = "projects/example-project/locations/global/hubs/example-hub"
  deletion_policy = "PREVENT"

  linked_vpn_tunnels {
    uris = [
      "https://www.googleapis.com/compute/v1/projects/example-project/regions/us-central1/vpnTunnels/example-tunnel"
    ]

    site_to_site_data_transfer = false
  }
}