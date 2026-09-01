# Compliant fixture: the regional security policy rule is protected from destructive Terraform deletion.

resource "google_compute_region_security_policy_rule" "compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1000
  action          = "deny(403)"
  deletion_policy = "PREVENT"

  match {
    versioned_expr = "SRC_IPS_V1"

    config {
      src_ip_ranges = ["203.0.113.0/24"]
    }
  }
}