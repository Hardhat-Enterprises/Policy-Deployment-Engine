# Tests the s_sl_info.client_auth_enabled argument.
# false is non-compliant because mutual TLS authentication is disabled.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "non-mtls-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled             = true
    client_auth_enabled = false
    trust_store         = "ref://example-truststore-reference"
  }
}
