resource "google_compute_region_security_policy" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  type            = "CLOUD_ARMOR_NETWORK"
  deletion_policy = "PREVENT"

  rules {
    action   = "deny(403)"
    priority = 1000

    network_match {
      src_region_codes = ["AU"]
    }
  }
}