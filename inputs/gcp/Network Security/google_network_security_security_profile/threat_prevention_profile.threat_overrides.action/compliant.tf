resource "google_network_security_security_profile" "compliant_example_1" {
  name   = "compliant_example_1"
  type   = "THREAT_PREVENTION"
  parent = "organizations/123456789"

  threat_prevention_profile {
    threat_overrides {
      threat_id = "280647"
      action    = "DENY"
    }
  }
}
