# Tests the s_sl_info.enforce argument of google_apigee_target_server.
# true is compliant because strict TLS certificate validation is enforced.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "strict-tls-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled     = true
    enforce     = true
    trust_store = "ref://example-truststore-reference"
  }
}