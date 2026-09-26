# Tests the s_sl_info.client_auth_enabled argument.
# true is compliant because it enables mutual TLS authentication.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "mtls-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled             = true
    client_auth_enabled = true
    key_store           = "ref://example-keystore-reference"
    key_alias           = "example-client-certificate"
    trust_store         = "ref://example-truststore-reference"
  }
}
