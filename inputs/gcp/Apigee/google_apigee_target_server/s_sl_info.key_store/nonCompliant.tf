# Tests the s_sl_info.key_store argument.
# The configured keystore is not approved for client authentication.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "unapproved-keystore-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled             = true
    client_auth_enabled = true
    key_store           = "ref://unapproved-keystore-reference"
    key_alias           = "approved-client-certificate"
    trust_store         = "ref://approved-truststore-reference"
  }
}
