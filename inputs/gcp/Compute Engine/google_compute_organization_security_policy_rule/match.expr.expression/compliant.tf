resource "google_compute_organization_security_policy_rule" "compliant_example_1" {
  policy_id   = "organizations/123456789/securityPolicies/1234567890"
  action      = "allow"
  description = "compliant_example_1"

  match {
    expr {
      expression = "request.path.startsWith('/api/v1/')"
    }
    versioned_expr = ""
  }

  priority = 100
}
