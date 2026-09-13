# Tests the request_json_paths argument.
# The configured JSONPath expressions mask sensitive request data.

resource "google_apigee_environment_debugmask" "compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  request_json_paths = [
    "$.password",
    "$.accessToken"
  ]
}
