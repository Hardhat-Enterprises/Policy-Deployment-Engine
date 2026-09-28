resource "google_compute_security_policy" "compliant_example_1" {
  name            = "compliant-example-1"
  deletion_policy = "PREVENT"
}
