# Tests the service_account argument.
# A default Compute Engine service account is not approved for the API proxy.

resource "google_apigee_environment_api_revision_deployment" "non_compliant_example_1" {
  org_id      = "example-org"
  environment = "test"
  api         = "example-api-proxy"
  revision    = 1

  service_account = "123456789-compute@developer.gserviceaccount.com"
}
