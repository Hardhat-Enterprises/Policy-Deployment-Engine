# Non-compliant fixture: rate-limited requests use an unapproved denial response.

resource "google_compute_region_security_policy_rule" "non_compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1000
  action          = "throttle"

  match {
    versioned_expr = "SRC_IPS_V1"

    config {
      src_ip_ranges = ["203.0.113.0/24"]
    }
  }

  rate_limit_options {
    exceed_action = "deny(403)"

    rate_limit_threshold {
      count        = 100
      interval_sec = 60
    }

    conform_action = "allow"
  }
}
