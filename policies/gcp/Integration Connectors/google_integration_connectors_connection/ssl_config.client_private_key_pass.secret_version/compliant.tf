resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-ssl-client_private_key_pass"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  ssl_config {
    type        = "MTLS"
    trust_model = "PRIVATE"
    use_ssl     = true
    client_private_key_pass {
      secret_version = "projects/test-project/secrets/s1/versions/5"
    }
  }
}
