resource "google_vmwareengine_network_peering" "non_compliant_example_1" {
    name = "non_compliant_example_1"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/default-np-nw"
    peer_network = "projects/my-project/locations/global/vmwareEngineNetworks/peer-np-nw"
    peer_network_type = "VMWARE_ENGINE_NETWORK"
    import_custom_routes_with_public_ip = true
}
