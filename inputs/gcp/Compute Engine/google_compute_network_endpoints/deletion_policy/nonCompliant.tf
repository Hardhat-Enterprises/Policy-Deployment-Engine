resource "google_compute_network_endpoints" "non_compliant_example_1" {
  network_endpoint_group = "projects/fake-project/zones/us-central1-a/networkEndpointGroups/noncompliant-neg"
  zone                    = "us-central1-a"
  deletion_policy         = "DELETE"

  network_endpoints {
    ip_address = "10.0.0.7"
    port       = 90
  }
}
