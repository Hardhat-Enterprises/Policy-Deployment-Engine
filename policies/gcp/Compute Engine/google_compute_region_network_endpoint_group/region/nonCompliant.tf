resource "google_compute_region_network_endpoint_group" "non_compliant_example_1" {
  name                  = "neg-noncompliant-1"
  network_endpoint_type = "SERVERLESS"
  region                = "us-central1"
}
