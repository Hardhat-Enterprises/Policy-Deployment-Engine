# Tests the condition_config.region_codes argument.
# AU and NZ are approved geographic regions for this security action.

resource "google_apigee_security_action" "compliant_example_1" {
  security_action_id = "approved-region-security-action"
  org_id              = "example-org"
  env_id              = "test"
  state               = "ENABLED"

  allow {}

  condition_config {
    region_codes = [
      "AU",
      "NZ"
    ]
  }
}
