# Tests the deletion_policy argument.
# DELETE is non-compliant because it allows Terraform to delete the deployment.

resource "google_apigee_environment_api_revision_deployment" "non_compliant_example_1" {
  org_id      = "example-org"
  environment = "test"
  api         = "example-api-proxy"
  revision    = 1

  deletion_policy = "DELETE"
}
