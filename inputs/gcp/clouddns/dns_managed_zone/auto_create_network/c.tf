

resource "google_compute_network" "c" {
    project = "dns_managed_zone"
    name = "network-1"
    auto_create_subnetworks = false
}
