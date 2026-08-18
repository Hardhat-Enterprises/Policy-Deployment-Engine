resource "google_vmwareengine_network_peering" "compliant_example_1" {
    name = "compliant_example_1"
    description = "Sample description"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/default-np-nw"
    peer_network = "projects/my-project/locations/global/vmwareEngineNetworks/peer-np-nw"
    peer_network_type = "VMWARE_ENGINE_NETWORK"
    export_custom_routes = false
    import_custom_routes = false
    export_custom_routes_with_public_ip = false
    import_custom_routes_with_public_ip = false
}
