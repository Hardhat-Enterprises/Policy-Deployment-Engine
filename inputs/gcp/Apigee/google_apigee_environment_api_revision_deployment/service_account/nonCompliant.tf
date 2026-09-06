# Tests the service_account argument.
# No service account is configured for the API proxy.

resource "google_apigee_environment_api_revision_deployment" "non_compliant_example_1" {
  org_id      = "example-org"
  environment = "test"
  api         = "example-api-proxy"
  revision    = 1
}
