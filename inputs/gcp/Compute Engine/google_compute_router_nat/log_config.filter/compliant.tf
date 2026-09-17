resource "google_compute_router_nat" "compliant_example_1" {
    name = "compliant-example-1"
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    router = "test-router"
    region = "australia-southeast1"
    log_config { 
        enable = true
        filter = "ALL"
        }
}
