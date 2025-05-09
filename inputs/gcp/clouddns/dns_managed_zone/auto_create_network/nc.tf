# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_compute_network" "nc"{
    project = "dns_managed_zone"
    name = "network-1"
    auto_create_subnetworks = true
}
