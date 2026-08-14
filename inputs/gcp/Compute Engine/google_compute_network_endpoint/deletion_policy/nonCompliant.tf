resource "google_compute_network_endpoint" "non_compliant_example_1" {
  network_endpoint_group = "projects/fake-project/zones/us-central1-a/networkEndpointGroups/noncompliant-neg"
  zone                    = "us-central1-a"
  ip_address              = "10.0.0.6"
  port                    = 90
  deletion_policy         = "DELETE"
}
