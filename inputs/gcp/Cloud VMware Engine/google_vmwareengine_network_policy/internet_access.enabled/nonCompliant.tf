resource "google_vmwareengine_network_policy" "non_compliant_example_1" {
    location = "us-west1"
    name = "non_compliant_example_1"
    edge_services_cidr = "192.168.30.0/26"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/sample-network"
    description = "Sample Network Policy"
    internet_access {
        enabled = true
    }
    external_ip {
        enabled = false
    }
}
