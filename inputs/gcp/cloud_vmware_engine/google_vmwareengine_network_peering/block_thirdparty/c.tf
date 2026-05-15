
resource "google_vmwareengine_network_peering" "c" {
  project                             = "project-d7f19645-ccba-48ef-bce"
  name                                = "c"
  description                         = "c"
  vmware_engine_network               = "projects/599444694846/locations/global/vmwareEngineNetworks/c"
  peer_network                        = "projects/599444694846/locations/global/vmwareEngineNetworks/peer-c"
  peer_network_type                   = "VMWARE_ENGINE_NETWORK"
  export_custom_routes                = false
  import_custom_routes                = false
  export_custom_routes_with_public_ip = false
  import_custom_routes_with_public_ip = false
}
