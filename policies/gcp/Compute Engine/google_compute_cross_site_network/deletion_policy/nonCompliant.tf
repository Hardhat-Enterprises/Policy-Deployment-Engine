resource "google_compute_cross_site_network" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "my-project"
  deletion_policy = "DELETE"
}