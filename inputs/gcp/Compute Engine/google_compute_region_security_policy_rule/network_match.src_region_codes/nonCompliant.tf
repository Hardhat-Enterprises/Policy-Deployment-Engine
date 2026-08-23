# Non-compliant fixture: source traffic includes a region outside the approved geographic baseline.

resource "google_compute_region_security_policy_rule" "non_compliant_example_1" {
  region          = "australia-southeast1"
  security_policy = "example-regional-security-policy"
  priority        = 1001
  action          = "deny(403)"

  network_match {
    src_region_codes = ["AU", "US"]
  }
}