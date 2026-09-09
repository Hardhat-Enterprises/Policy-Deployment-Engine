# Compute Region Security Policy with a non-approved region.

resource "google_compute_region_security_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "pde-project-vindya"
  region          = "us-central1"
  deletion_policy = "PREVENT"
}