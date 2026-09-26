resource "google_compute_packet_mirroring" "non_compliant_example_1" {
    name = "non-compliant-example-1"
    network {
        url = "projects/example-project/global/networks/example-network"
    }
    collector_ilb {
        url = "projects/example-project/regions/australia-southeast1/forwardingRules/example-ilb"
    }
    mirrored_resources {
        subnetworks {
            url = "projects/example-project/regions/australia-southeast1/subnetworks/example-subnet"
        }
    }
    enable = "FALSE"
}
