# Compliant fixture: the user-defined field targets a deliberately scoped value range.

resource "google_compute_region_security_policy_rule" "compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1000
  action          = "deny(403)"

  network_match {
    user_defined_fields {
      name   = "test-field"
      values = ["64", "0x400-0x7ff"]
    }
  }
}