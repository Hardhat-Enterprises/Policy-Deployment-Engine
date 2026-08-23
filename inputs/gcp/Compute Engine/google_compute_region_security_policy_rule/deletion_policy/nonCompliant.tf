# Non-compliant fixture: Terraform is permitted to delete the regional security policy rule.

resource "google_compute_region_security_policy_rule" "non_compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1001
  action          = "deny(403)"
  deletion_policy = "DELETE"

  match {
    versioned_expr = "SRC_IPS_V1"

    config {
      src_ip_ranges = ["203.0.113.0/24"]
    }
  }
}