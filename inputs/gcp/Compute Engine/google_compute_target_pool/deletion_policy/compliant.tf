resource "google_compute_target_pool" "compliant_example_1" {
  name            = "compliant-example-1"
  deletion_policy = "DELETE"
}