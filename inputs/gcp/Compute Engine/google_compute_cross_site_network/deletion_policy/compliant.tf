resource "google_compute_cross_site_network" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "my-project"
  deletion_policy = "PREVENT"
}