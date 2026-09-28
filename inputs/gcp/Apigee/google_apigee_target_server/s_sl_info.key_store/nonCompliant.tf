# Tests the s_sl_info.key_store argument.
# The keystore is non-compliant because it is empty.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "unapproved-keystore-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled             = true
    client_auth_enabled = true
    key_store           = ""
    key_alias           = "approved-client-certificate"
    trust_store         = "ref://approved-truststore-reference"
  }
}
