# Tests the fault_x_paths argument.
# The configured XPath expressions mask sensitive XML fields in fault messages.

resource "google_apigee_environment_debugmask" "compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  fault_x_paths = [
    "//password",
    "//accessToken"
  ]
}
