resource "google_compute_organization_security_policy_rule" "compliant_example_1" {
  policy_id   = "organizations/123456789/securityPolicies/1234567890"
  action      = "allow"
  description = "compliant_example_1"

  match {
    config {
      src_ip_ranges = ["192.168.0.0/16"]
    }
    versioned_expr = "SRC_IPS_V1"
  }

  priority = 100
}
