resource "google_compute_interconnect_attachment" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "my-project"
  region          = "australia-southeast1"
  deletion_policy = "DELETE"
}