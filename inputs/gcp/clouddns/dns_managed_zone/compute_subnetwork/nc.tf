

resource "google_compute_subnetwork" "nc" {
    name = "google-compute-network"
    project = "dns_managed_zone"
    network = "google_compute_network.net-1.pde"
    ip_cidr_range = "10.0.36.0/24"
    region = "australia-southeast2"
}