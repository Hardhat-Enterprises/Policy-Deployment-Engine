# Tests the deletion_policy argument of google_apigee_security_action.
# DELETE is non-compliant because it allows Terraform to delete the action.

resource "google_apigee_security_action" "non_compliant_example_1" {
  security_action_id = "unprotected-security-action"
  org_id              = "example-org"
  env_id              = "test"
  state               = "ENABLED"

  allow {}

  condition_config {
    ip_address_ranges = [
      "192.0.2.10/32"
    ]
  }

  deletion_policy = "DELETE"
}
