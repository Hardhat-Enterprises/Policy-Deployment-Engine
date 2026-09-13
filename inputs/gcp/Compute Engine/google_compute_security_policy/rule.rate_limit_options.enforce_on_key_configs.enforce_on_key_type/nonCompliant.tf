resource "google_compute_security_policy" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  rule {
    action   = "throttle"
    priority = "1000"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    rate_limit_options {
      conform_action = "allow"
      exceed_action  = "deny(429)"
      enforce_on_key = ""
      enforce_on_key_configs {
        enforce_on_key_type = "ALL"
      }
      rate_limit_threshold {
        count        = 100
        interval_sec = 60
      }
    }
  }
}