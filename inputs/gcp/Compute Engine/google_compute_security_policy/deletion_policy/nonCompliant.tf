resource "google_compute_security_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  deletion_policy = "DELETE"
}
