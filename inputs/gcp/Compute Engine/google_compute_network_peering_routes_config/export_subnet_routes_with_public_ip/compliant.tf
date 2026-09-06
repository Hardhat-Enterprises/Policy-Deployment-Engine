resource "google_compute_network_peering_routes_config" "compliant_example_1" {
  peering                               = "compliant_example_1"
  network                               = "projects/fake-project/global/networks/fake-network"
  export_custom_routes                  = false
  import_custom_routes                  = false
  export_subnet_routes_with_public_ip   = false
}
