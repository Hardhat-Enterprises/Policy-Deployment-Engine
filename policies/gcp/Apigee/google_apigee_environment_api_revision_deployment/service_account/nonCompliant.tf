# Tests the service_account argument.
# The configured value is not a valid Google Cloud service account email.

resource "google_apigee_environment_api_revision_deployment" "non_compliant_example_1" {
  org_id      = "example-org"
  environment = "test"
  api         = "example-api-proxy"
  revision    = 1

  service_account = "apigee-runtime@example-project.iam.invalid.com"
}
