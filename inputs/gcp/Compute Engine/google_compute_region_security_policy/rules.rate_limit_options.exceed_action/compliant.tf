resource "google_compute_region_security_policy" "compliant_example_1" {
  name            = "compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  type            = "CLOUD_ARMOR"
  deletion_policy = "PREVENT"

  rules {
    action   = "rate_based_ban"
    priority = 1000

    match {
      versioned_expr = "SRC_IPS_V1"

      config {
        src_ip_ranges = ["*"]
      }
    }

    rate_limit_options {
      ban_duration_sec    = 600
      conform_action      = "allow"
      exceed_action       = "deny(429)"
      enforce_on_key      = "IP"

      rate_limit_threshold {
        count        = 100
        interval_sec = 60
      }

      ban_threshold {
        count        = 200
        interval_sec = 60
      }
    }
  }
}