# Tests the s_sl_info.key_alias argument.
# The approved alias identifies the client certificate used for mutual TLS.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "approved-certificate-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled             = true
    client_auth_enabled = true
    key_store           = "ref://example-keystore-reference"
    key_alias           = "approved-client-certificate"
    trust_store         = "ref://example-truststore-reference"
  }
}
