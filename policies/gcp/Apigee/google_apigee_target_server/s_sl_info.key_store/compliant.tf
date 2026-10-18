# Tests the s_sl_info.key_store argument.
# The approved keystore contains the client key and certificate used for mTLS.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "approved-keystore-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled             = true
    client_auth_enabled = true
    key_store           = "ref://approved-keystore-reference"
    key_alias           = "approved-client-certificate"
    trust_store         = "ref://approved-truststore-reference"
  }
}
