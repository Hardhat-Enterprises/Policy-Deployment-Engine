resource "google_vmwareengine_network" "network-policy-nw" {
    name              = "sample-network"
    location          = "global" 
    type              = "STANDARD"
    description       = "VMwareEngine standard network sample"
}

resource "google_vmwareengine_network_policy" "c" {
    location = "us-west1"
    name = "sample-network-policy-c"
    edge_services_cidr = "192.168.30.0/26"
    vmware_engine_network = google_vmwareengine_network.network-policy-nw.id
    description = "Sample Network Policy"
    internet_access {
        enabled = true
    }
    external_ip {
        enabled = false
    }
}
