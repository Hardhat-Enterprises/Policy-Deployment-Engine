# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_compute_network" "c" {
    project = "dns_managed_zone"
    name = "network-1"
    auto_create_subnetworks = false
}
