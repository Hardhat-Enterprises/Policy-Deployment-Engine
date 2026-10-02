# Non-compliant fixture: no target rule IDs are specified, leaving the WAF exclusion unscoped.

resource "google_compute_security_policy_rule" "non_compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "deny(403)"

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-v33-stable"
      target_rule_ids = []
    }
  }
}