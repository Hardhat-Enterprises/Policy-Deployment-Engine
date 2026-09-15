# Tests the s_sl_info.enforce argument of google_apigee_target_server.
# false is non-compliant because strict TLS certificate validation is not enforced.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "non-strict-tls-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled     = true
    enforce     = false
    trust_store = "ref://example-truststore-reference"
  }
}