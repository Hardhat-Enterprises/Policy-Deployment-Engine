# Tests the deletion_policy argument.
# PREVENT is compliant because it protects the deployed API revision from deletion.

resource "google_apigee_environment_api_revision_deployment" "compliant_example_1" {
  org_id      = "example-org"
  environment = "test"
  api         = "example-api-proxy"
  revision    = 1

  deletion_policy = "PREVENT"
}
