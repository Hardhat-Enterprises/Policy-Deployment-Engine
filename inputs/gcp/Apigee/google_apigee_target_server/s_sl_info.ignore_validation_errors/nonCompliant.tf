# Tests the s_sl_info.ignore_validation_errors argument.
# true is non-compliant because invalid backend certificates may be accepted.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "ignored-validation-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled                  = true
    ignore_validation_errors = true
    trust_store              = "ref://example-truststore-reference"
  }
}
