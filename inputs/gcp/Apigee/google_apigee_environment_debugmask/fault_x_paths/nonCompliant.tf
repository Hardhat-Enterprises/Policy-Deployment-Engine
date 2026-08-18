# Tests the fault_x_paths argument.
# The configured XPath does not mask the approved sensitive XML fields.

resource "google_apigee_environment_debugmask" "non_compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  fault_x_paths = [
    "//nonSensitiveField"
  ]
}
