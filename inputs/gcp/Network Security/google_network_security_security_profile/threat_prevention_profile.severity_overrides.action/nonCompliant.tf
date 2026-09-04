resource "google_network_security_security_profile" "non_compliant_example_1" {
  name   = "non_compliant_example_1"
  type   = "THREAT_PREVENTION"
  parent = "organizations/123456789"

  threat_prevention_profile {
    severity_overrides {
      severity = "HIGH"
      action   = "ALLOW"
    }
  }
}
