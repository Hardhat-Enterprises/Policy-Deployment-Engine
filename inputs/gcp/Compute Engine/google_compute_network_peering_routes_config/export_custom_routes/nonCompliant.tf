resource "google_compute_network_peering_routes_config" "non_compliant_example_1" {
  peering               = "non_compliant_example_1"
  network               = "projects/fake-project/global/networks/fake-network"
  export_custom_routes  = true
  import_custom_routes  = false
}
