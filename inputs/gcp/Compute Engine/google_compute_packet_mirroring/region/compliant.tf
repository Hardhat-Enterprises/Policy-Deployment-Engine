resource "google_compute_packet_mirroring" "compliant_example_1" {
    name = "compliant-example-1"
    network {
        url = google_compute_network.default.id
    }
    collector_ilb {
        url = google_compute_forwarding_rule.default.id
    }
    mirrored_resources {
        subnetworks {
            url = google_compute_subnetwork.default.id
        }
    }
    region = "australia-east1"
}
