# Tests the s_sl_info.ignore_validation_errors argument.
# false is compliant because TLS certificate validation errors are not ignored.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "certificate-validation-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled                  = true
    ignore_validation_errors = false
    trust_store              = "ref://example-truststore-reference"
  }
}
