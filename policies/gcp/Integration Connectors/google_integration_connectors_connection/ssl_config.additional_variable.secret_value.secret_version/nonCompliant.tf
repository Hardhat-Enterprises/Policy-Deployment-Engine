resource "google_integration_connectors_connection" "non_compliant_example_1" {
  name              = "noncompliant-sslav-1"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  ssl_config {
    type        = "TLS"
    trust_model = "PUBLIC"
    use_ssl     = true
    additional_variable {
      key = "k1"
      secret_value {
        secret_version = "projects/test-project/secrets/s1/versions/latest"
      }
    }
  }
}
