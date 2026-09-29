resource "google_compute_global_address" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  deletion_policy = "DELETE"
}