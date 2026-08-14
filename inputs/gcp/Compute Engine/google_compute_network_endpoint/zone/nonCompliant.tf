resource "google_compute_network_endpoint" "non_compliant_example_1" {
  network_endpoint_group = "projects/fake-project/zones/europe-west1-a/networkEndpointGroups/fake-neg"
  ip_address              = "10.0.0.6"
  port                    = 90
  zone                    = "europe-west1-a"
}
