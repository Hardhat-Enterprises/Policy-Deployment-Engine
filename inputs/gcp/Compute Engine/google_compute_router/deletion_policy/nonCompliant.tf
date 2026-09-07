resource "google_compute_router" "non_compliant_example_1" {
  name            = "noncompliant-deletion-policy-router"
  region          = "australia-southeast2"
  network         = "default"
  deletion_policy = "ABANDON"
}