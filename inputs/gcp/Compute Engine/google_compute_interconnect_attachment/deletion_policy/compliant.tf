resource "google_compute_interconnect_attachment" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "smooth-verve-467716-v1"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
}