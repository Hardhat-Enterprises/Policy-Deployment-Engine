# Non-compliant fixture: the user-defined field matches the complete 32-bit value space.

resource "google_compute_region_security_policy_rule" "non_compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1000
  action          = "deny(403)"

  network_match {
    user_defined_fields {
      name   = "test-field"
      values = ["0-4294967295"]
    }
  }
}
