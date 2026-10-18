# Tests the s_sl_info.trust_store argument.
# The approved truststore is used to validate the backend TLS certificate.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "approved-truststore-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled                  = true
    enforce                  = true
    ignore_validation_errors = false
    trust_store              = "ref://approved-truststore-reference"
  }
}
