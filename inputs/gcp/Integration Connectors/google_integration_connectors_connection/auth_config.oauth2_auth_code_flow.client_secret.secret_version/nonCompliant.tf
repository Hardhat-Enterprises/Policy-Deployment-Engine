resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-oacf-1"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "OAUTH2_AUTH_CODE_FLOW"
    oauth2_auth_code_flow {
      client_id = "cid"
      client_secret {
        secret_version = "projects/test-project/secrets/s1/versions/latest"
      }
    }
  }
}
