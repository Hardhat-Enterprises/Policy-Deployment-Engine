# Non-compliant fixture: EQUALS_ANY creates an unrestricted query-parameter WAF exclusion.

resource "google_compute_security_policy_rule" "non_compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "deny(403)"

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-v33-stable"

      request_query_param {
        operator = "EQUALS_ANY"
      }
    }
  }
}