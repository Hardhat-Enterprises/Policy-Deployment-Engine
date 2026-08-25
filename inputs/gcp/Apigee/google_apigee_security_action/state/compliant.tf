# Tests the state argument of google_apigee_security_action.
# ENABLED is compliant because the security action is active.

resource "google_apigee_security_action" "compliant_example_1" {
  security_action_id = "enabled-security-action"
  org_id              = "example-org"
  env_id              = "test"
  state               = "ENABLED"

  allow {}

  condition_config {
    ip_address_ranges = [
      "192.0.2.10/32"
    ]
  }
}
