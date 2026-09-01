resource "google_compute_region_network_endpoint" "non_compliant_example_1" {
  region_network_endpoint_group = "non_compliant_example_1"
  region                        = "us-central1"
  ip_address                    = "8.8.8.8"
  port                          = 443
}
