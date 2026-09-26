resource "google_compute_interconnect_attachment" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "my-project"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
}