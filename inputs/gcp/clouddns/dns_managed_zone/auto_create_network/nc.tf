

resource "google_compute_network" "nc"{
    project = "dns_managed_zone"
    name = "network-1"
    auto_create_subnetworks = true
}
