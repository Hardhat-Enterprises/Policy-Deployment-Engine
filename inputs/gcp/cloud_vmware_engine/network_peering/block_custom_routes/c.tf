# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_vmwareengine_network" "network-peering-nw" {
   name              = "default-np-nw"
   location          = "global"
   type              = "STANDARD"
}
resource "google_vmwareengine_network" "network-peering-peer-nw" {
   name              = "peer-np-nw"
   location          = "global"
   type              = "STANDARD"
}
resource "google_vmwareengine_network_peering" "c" {
    name = "sample-network-peering-c"

    vmware_engine_network = google_vmwareengine_network.network-peering-nw.id
    peer_network = google_vmwareengine_network.network-peering-peer-nw.id
    peer_network_type = "VMWARE_ENGINE_NETWORK"
    import_custom_routes_with_public_ip = false
}
