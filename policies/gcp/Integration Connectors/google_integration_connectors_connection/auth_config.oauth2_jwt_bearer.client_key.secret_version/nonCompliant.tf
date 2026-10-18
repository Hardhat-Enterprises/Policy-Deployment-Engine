resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-ojb-1"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "OAUTH2_JWT_BEARER"
    oauth2_jwt_bearer {
      client_key {
        secret_version = "projects/test-project/secrets/s1/versions/latest"
      }
    }
  }
}
