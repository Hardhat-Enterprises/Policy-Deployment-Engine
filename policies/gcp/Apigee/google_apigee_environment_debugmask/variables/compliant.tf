# Tests the variables argument.
# Sensitive authentication variables are masked in debug sessions.

resource "google_apigee_environment_debugmask" "compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  variables = [
    "request.header.authorization",
    "request.queryparam.api_key"
  ]
}
