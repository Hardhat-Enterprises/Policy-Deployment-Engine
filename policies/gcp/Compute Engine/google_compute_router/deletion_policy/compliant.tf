resource "google_compute_router" "compliant_example_1" {
  name            = "compliant-deletion-policy-router"
  region          = "australia-southeast2"
  network         = "default"
  deletion_policy = "DELETE"
}