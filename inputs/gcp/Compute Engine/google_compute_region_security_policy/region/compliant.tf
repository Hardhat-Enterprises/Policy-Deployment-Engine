# Compute Region Security Policy with an approved region.

resource "google_compute_region_security_policy" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
}