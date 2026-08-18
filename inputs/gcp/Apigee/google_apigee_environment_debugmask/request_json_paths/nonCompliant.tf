# Tests the request_json_paths argument.
# The configured path does not mask the approved sensitive request fields.

resource "google_apigee_environment_debugmask" "non_compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  request_json_paths = [
    "$.nonSensitiveField"
  ]
}
