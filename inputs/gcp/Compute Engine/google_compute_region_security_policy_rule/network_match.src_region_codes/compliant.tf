# Compliant fixture: source traffic is restricted to approved geographic regions.

resource "google_compute_region_security_policy_rule" "compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1000
  action          = "deny(403)"

  network_match {
    src_region_codes = ["AU", "NZ"]
  }
}