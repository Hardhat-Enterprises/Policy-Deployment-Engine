resource "google_compute_target_pool" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  deletion_policy = "ABANDON"
}
