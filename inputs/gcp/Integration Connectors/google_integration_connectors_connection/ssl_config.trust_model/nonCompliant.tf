resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-conn-1"
  location          = "australia-southeast1"
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

  ssl_config {
    type        = "TLS"
    use_ssl     = true
    trust_model = "INSECURE"
  }
}
