resource "google_vmwareengine_network_peering" "nc" {
  project                             = "project-d7f19645-ccba-48ef-bce"
  name                                = "nc"
  description                         = "nc"
  vmware_engine_network               = "projects/599444694846/locations/global/vmwareEngineNetworks/nc"
  peer_network                        = "projects/599444694846/locations/global/vmwareEngineNetworks/peer-nc"
  peer_network_type                   = "THIRD_PARTY_SERVICE"
  import_custom_routes_with_public_ip = true
}