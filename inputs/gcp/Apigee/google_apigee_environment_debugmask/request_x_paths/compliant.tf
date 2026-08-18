# Tests the request_x_paths argument.
# The configured XPath expressions mask sensitive XML request data.

resource "google_apigee_environment_debugmask" "compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  request_x_paths = [
    "//password",
    "//accessToken"
  ]
}
