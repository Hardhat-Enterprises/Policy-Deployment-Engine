resource "google_compute_network_endpoints" "compliant_example_1" {
  network_endpoint_group = "compliant_example_1"
  zone                    = "us-central1-a"
  network_endpoints {
    ip_address = "10.0.0.5"
    port       = 90
  }
}
