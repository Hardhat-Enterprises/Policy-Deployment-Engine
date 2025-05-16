resource "google_vmwareengine_network" "network-peering-nw_nc" {
   name              = "default-np-nw"
   location          = "global"
   type              = "STANDARD"
}
resource "google_vmwareengine_network" "network-peering-peer-nw_nc" {
   name              = "peer-np-nw"
   location          = "global"
   type              = "STANDARD"
}
resource "google_vmwareengine_network_peering" "nc" {
    name = "sample-network-peering-nc"
    description = "Sample description"
    vmware_engine_network = google_vmwareengine_network.network-peering-nw_nc.id
    peer_network = google_vmwareengine_network.network-peering-peer-nw_nc.id
    peer_network_type = "THIRD_PARTY_SERVICE"
    import_custom_routes_with_public_ip = true
}