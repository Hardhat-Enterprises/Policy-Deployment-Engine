resource "google_integration_connectors_connection" "compliant_example_1" {
  name              = "compliant-sshp-1"
  location          = "australia-southeast1"
  connector_version = "projects/test-project/locations/global/providers/zendesk/connectors/zendesk/versions/1"

  auth_config {
    auth_type = "SSH_PUBLIC_KEY"
    ssh_public_key {
      username = "svc"
      ssh_client_cert_pass {
        secret_version = "projects/test-project/secrets/s1/versions/5"
      }
    }
  }
}
