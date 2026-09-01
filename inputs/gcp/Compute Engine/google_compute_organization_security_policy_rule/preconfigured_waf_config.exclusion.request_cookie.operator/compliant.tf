resource "google_compute_organization_security_policy" "policy" {
  short_name = "tf-test-policy"
  parent     = "organizations/123456789"
  type       = "CLOUD_ARMOR"
}

resource "google_compute_organization_security_policy_rule" "compliant_example_1" {
  policy_id   = google_compute_organization_security_policy.policy.id
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
      request_cookie {
        operator = "EQUALS"
        value    = "session_id"
      }
    }
  }

  priority = 100
}
