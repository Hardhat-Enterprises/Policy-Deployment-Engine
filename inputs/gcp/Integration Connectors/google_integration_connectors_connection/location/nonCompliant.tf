resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-location-1"
  location          = "us-central1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "USER_PASSWORD"
    user_password {
      username = "user@example.com"
      password {
        secret_version = "projects/test-project/secrets/conn-pw/versions/5"
      }
    }
  }
}
