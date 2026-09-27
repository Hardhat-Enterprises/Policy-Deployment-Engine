resource "google_compute_region_security_policy" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
  type            = "CLOUD_ARMOR_NETWORK"

  rules {
    action   = "deny(403)"
    priority = 1000
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["0.0.0.0/0"]
      }
    }
  }
}