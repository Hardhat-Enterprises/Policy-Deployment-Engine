# Compute Region Security Policy without deletion protection.

resource "google_compute_region_security_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  deletion_policy = "DELETE"
}