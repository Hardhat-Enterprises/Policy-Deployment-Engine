# Compliant fixture: the WAF cookie exclusion uses an explicitly scoped match operator.

resource "google_compute_region_security_policy_rule" "compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1000
  action          = "deny(403)"

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-v33-stable"

      request_cookie {
        operator = "EQUALS"
        value    = "trusted-session"
      }
    }
  }
}