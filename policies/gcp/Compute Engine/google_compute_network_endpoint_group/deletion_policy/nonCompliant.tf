resource "google_compute_network_endpoint_group" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  network         = "projects/example-project/global/networks/example-network"
  zone            = "australia-southeast1-a"
  deletion_policy = "ABANDON"
}
