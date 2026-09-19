resource "google_compute_router_nat" "non_compliant_example_1" {
    name = "non-compliant-example-1"
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    router = "test-router"
    region = "australia-southeast1"
    deletion_policy = "DELETE"
}
