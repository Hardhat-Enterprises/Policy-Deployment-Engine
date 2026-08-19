# Tests the service_account argument.
# A dedicated, approved runtime service account is compliant.

resource "google_apigee_environment_api_revision_deployment" "compliant_example_1" {
  org_id      = "example-org"
  environment = "test"
  api         = "example-api-proxy"
  revision    = 1

  service_account = "apigee-runtime@example-project.iam.gserviceaccount.com"
}
