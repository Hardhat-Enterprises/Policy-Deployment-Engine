resource "google_compute_region_security_policy" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
  type            = "CLOUD_ARMOR"
}

resource "google_compute_region_security_policy" "non_compliant_example_2" {
  name            = "non_compliant_example_2"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
  type            = "CLOUD_ARMOR_EDGE"
}