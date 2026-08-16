resource "google_compute_network_endpoints" "non_compliant_example_1" {
  network_endpoint_group = "projects/fake-project/zones/europe-west1-a/networkEndpointGroups/noncompliant-neg"
  zone                    = "europe-west1-a"

  network_endpoints {
    ip_address = "10.0.0.6"
    port       = 90
  }
}
