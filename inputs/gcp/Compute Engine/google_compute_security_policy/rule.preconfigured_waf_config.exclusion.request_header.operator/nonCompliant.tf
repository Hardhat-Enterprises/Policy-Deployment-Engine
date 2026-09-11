resource "google_compute_security_policy" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  rule {
    action   = "deny(403)"
    priority = "1000"
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('sqli-v33-stable')"
      }
    }
    preconfigured_waf_config {
      exclusion {
        target_rule_set = "sqli-v33-stable"
        request_header {
          operator = "EQUALS_ANY"
        }
      }
    }
  }
}