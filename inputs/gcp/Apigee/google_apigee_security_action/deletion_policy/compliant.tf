# Tests the deletion_policy argument of google_apigee_security_action.
# PREVENT is compliant because it protects the security action from deletion.

resource "google_apigee_security_action" "compliant_example_1" {
  security_action_id = "protected-security-action"
  org_id              = "example-org"
  env_id              = "test"
  state               = "ENABLED"

  allow {}

  condition_config {
    ip_address_ranges = [
      "192.0.2.10/32"
    ]
  }

  deletion_policy = "PREVENT"
}
