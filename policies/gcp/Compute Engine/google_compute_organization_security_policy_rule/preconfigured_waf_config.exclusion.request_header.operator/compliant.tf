resource "google_compute_organization_security_policy_rule" "compliant_example_1" {
  policy_id   = "organizations/123456789/securityPolicies/1234567890"
  action      = "allow"
  description = "compliant_example_1"

  match {
    expr {
      expression = "evaluatePreconfiguredWaf('sqli-stable', {'sensitivity': 2})"
    }
    versioned_expr = ""
  }

  preconfigured_waf_config {
    exclusion {
      target_rule_set = "sqli-stable"
      request_header {
        operator = "STARTS_WITH"
        value    = "X-Debug"
      }
    }
  }

  priority = 100
}
