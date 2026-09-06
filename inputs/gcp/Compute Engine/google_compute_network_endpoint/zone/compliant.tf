resource "google_compute_network_endpoint" "compliant_example_1" {
  network_endpoint_group = "compliant_example_1"
  ip_address              = "10.0.0.5"
  port                    = 90
  zone                    = "us-central1-a"
}
