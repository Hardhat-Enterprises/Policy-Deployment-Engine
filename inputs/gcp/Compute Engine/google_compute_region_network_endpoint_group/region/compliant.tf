resource "google_compute_region_network_endpoint_group" "compliant_example_1" {
  name                  = "neg-compliant-1"
  network_endpoint_type = "SERVERLESS"
  region                = "australia-southeast1"
}
