resource "google_compute_region_network_endpoint" "compliant_example_1" {
  region_network_endpoint_group = "compliant_example_1"
  region                        = "australia-southeast1"
  ip_address                    = "8.8.8.8"
  port                          = 443
}
