# Tests the response_x_paths argument.
# The configured XPath does not mask the approved sensitive response fields.

resource "google_apigee_environment_debugmask" "non_compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  response_x_paths = [
    "//status"
  ]
}
