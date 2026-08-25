# Tests the state argument of google_apigee_security_action.
# DISABLED is non-compliant because the security action is inactive.

resource "google_apigee_security_action" "non_compliant_example_1" {
  security_action_id = "disabled-security-action"
  org_id              = "example-org"
  env_id              = "test"
  state               = "DISABLED"

  allow {}

  condition_config {
    ip_address_ranges = [
      "192.0.2.10/32"
    ]
  }
}
