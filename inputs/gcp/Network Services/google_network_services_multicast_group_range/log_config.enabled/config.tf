resource "google_compute_network" "network" {
  name                    = "multicast-group-range-network"
  auto_create_subnetworks = false
}

resource "google_network_services_multicast_domain" "example" {
  multicast_domain_id = "example-domain"
  location            = "global"
  admin_network       = google_compute_network.network.id

  connection_config {
    connection_type = "SAME_VPC"
  }

  depends_on = [
    google_compute_network.network
  ]
}

resource "google_network_connectivity_internal_range" "mcast_range" {
  name          = "mcast-internal-range"
  network       = google_compute_network.network.self_link
  usage         = "FOR_VPC"
  peering       = "FOR_SELF"
  ip_cidr_range = "224.2.0.2/32"
}