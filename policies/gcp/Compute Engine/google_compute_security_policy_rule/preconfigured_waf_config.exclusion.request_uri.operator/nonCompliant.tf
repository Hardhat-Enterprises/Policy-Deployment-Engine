# Non-compliant fixture: EQUALS_ANY creates an unrestricted URI WAF exclusion.

resource "google_compute_security_policy_rule" "non_compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "deny(403)"

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-v33-stable"

      request_uri {
        operator = "EQUALS_ANY"
      }
    }
  }
}