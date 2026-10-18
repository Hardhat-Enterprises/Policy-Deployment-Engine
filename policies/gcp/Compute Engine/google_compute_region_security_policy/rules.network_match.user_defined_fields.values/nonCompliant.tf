resource "google_compute_region_security_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  type            = "CLOUD_ARMOR_NETWORK"
  deletion_policy = "PREVENT"

  user_defined_fields {
    name   = "ipv4_fragment_offset"
    base   = "IPV4"
    offset = 6
    size   = 2
  }

  rules {
    action   = "deny(403)"
    priority = 1000

    network_match {
      user_defined_fields {
        name   = "ipv4_fragment_offset"
        values = ["0-0xffff"]
      }
    }
  }
}