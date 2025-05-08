# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_vmwareengine_network" "network-policy-nw_nc" {
    name              = "sample-network"
    location          = "global" 
    type              = "STANDARD"
    description       = "VMwareEngine standard network sample"
}

resource "google_vmwareengine_network_policy" "nc" {
    location = "us-east1"
    name = "sample-network-policy-nc"
    edge_services_cidr = "192.168.30.0/26"
    vmware_engine_network = google_vmwareengine_network.network-policy-nw_nc.id
}