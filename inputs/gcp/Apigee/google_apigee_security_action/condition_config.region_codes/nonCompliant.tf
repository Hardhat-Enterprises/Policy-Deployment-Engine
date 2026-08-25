# Tests the condition_config.region_codes argument.
# US is not included in the organisation's approved region list.

resource "google_apigee_security_action" "non_compliant_example_1" {
  security_action_id = "unapproved-region-security-action"
  org_id              = "example-org"
  env_id              = "test"
  state               = "ENABLED"

  allow {}

  condition_config {
    region_codes = [
      "US"
    ]
  }
}
