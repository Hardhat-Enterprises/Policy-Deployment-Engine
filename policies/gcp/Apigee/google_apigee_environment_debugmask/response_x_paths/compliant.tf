# Tests the response_x_paths argument.
# The configured XPath expressions mask sensitive XML response data.

resource "google_apigee_environment_debugmask" "compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  response_x_paths = [
    "//accessToken",
    "//customer/email"
  ]
}
