resource "google_compute_organization_security_policy" "policy" {
  short_name = "tf-test-policy"
  parent     = "organizations/123456789"
  type       = "CLOUD_ARMOR"
}

resource "google_compute_organization_security_policy_rule" "non_compliant_example_1" {
  policy_id   = google_compute_organization_security_policy.policy.id
  action      = "allow"
  description = "non_compliant_example_1"

  match {
    expr {
      expression = "evaluatePreconfiguredWaf('sqli-stable', {'sensitivity': 2})"
    }
    versioned_expr = ""
  }

  preconfigured_waf_config {
    exclusion {
      target_rule_set = ""
      target_rule_ids = ["sqli-stable-id-942100"]
      request_header {
        operator = "EQUALS"
        value    = "X-Debug"
      }
    }
  }

  priority = 100
}
