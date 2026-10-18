# Compliant fixture: the WAF exclusion is explicitly scoped to selected rule IDs.

resource "google_compute_security_policy_rule" "compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "deny(403)"

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-v33-stable"
      target_rule_ids = ["owasp-crs-v030301-id942110-sqli"]
    }
  }
}