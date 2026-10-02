# Compliant fixture: the rate-limit exceed redirect target uses HTTPS.

resource "google_compute_security_policy_rule" "compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "throttle"

  rate_limit_options {
    conform_action = "allow"
    exceed_action  = "redirect"
    enforce_on_key = "IP"

    rate_limit_threshold {
      count        = 10
      interval_sec = 60
    }

    exceed_redirect_options {
      type   = "EXTERNAL_302"
      target = "https://example.com/rate-limit"
    }
  }
}