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
      expression = "request.path.startsWith('/api/v1/')"
    }
    versioned_expr = ""
  }

  priority = 100
}
