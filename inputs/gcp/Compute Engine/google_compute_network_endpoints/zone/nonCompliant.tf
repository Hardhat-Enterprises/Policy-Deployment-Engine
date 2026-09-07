resource "google_compute_network_endpoints" "non_compliant_example_1" {
  network_endpoint_group = "non_compliant_example_1"
  zone                    = "europe-west1-a"
  network_endpoints {
    ip_address = "10.0.0.5"
    port       = 90
  }
}
