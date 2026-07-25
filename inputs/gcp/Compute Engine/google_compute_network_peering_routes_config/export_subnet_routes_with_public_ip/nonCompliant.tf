resource "google_compute_network_peering_routes_config" "non_compliant_example_1" {
  peering                               = "noncompliant-peering-example"
  network                               = "projects/fake-project/global/networks/fake-network"
  export_custom_routes                  = false
  import_custom_routes                  = false
  export_subnet_routes_with_public_ip   = true
}
