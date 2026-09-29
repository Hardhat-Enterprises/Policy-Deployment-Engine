resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-occ-1"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "OAUTH2_CLIENT_CREDENTIALS"
    oauth2_client_credentials {
      client_id = "cid"
      client_secret {
        secret_version = "projects/test-project/secrets/s1/versions/5"
      }
    }
  }
}
