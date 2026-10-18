resource "google_compute_global_address" "compliant_example_1" {
  name            = "compliant-example-1"
  deletion_policy = "PREVENT"
}