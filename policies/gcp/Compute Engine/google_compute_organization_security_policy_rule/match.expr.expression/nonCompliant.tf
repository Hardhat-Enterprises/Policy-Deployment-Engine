resource "google_compute_organization_security_policy_rule" "non_compliant_example_1" {
  policy_id   = "organizations/123456789/securityPolicies/1234567890"
  action      = "allow"
  description = "non_compliant_example_1"

  match {
    expr {
      expression = "true"
    }
    versioned_expr = ""
  }

  priority = 100
}
