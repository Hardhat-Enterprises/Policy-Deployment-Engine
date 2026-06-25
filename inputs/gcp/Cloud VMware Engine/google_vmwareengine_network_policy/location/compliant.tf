resource "google_vmwareengine_network_policy" "compliant_example_1" {
    location = "australia-southeast1"
    name = "compliant_example_1"
    edge_services_cidr = "192.168.30.0/26"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/sample-network"
}
