# Non-compliant fixture: EQUALS_ANY creates an unrestricted cookie-value WAF exclusion.

resource "google_compute_region_security_policy_rule" "non_compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1001
  action          = "deny(403)"

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-v33-stable"

      request_cookie {
        operator = "EQUALS_ANY"
      }
    }
  }
}