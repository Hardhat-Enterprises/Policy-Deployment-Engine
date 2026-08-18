# Tests the variables argument.
# Only a non-sensitive variable is masked, leaving approved sensitive variables exposed.

resource "google_apigee_environment_debugmask" "non_compliant_example_1" {
  env_id = "organizations/example-org/environments/test"

  variables = [
    "request.verb"
  ]
}
