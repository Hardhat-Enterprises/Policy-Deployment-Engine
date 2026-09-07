# Tests the response_json_paths argument.
# The configured JSONPath expressions mask sensitive response data.

resource "google_apigee_environment_debugmask" "compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  response_json_paths = [
    "$.accessToken",
    "$.customer.email"
  ]
}
