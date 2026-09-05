# Tests the s_sl_info.common_name.value argument.
# An empty value fails the required presence check.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "invalid-common-name-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled                  = true
    enforce                  = true
    ignore_validation_errors = false
    trust_store              = "ref://approved-truststore-reference"

    common_name {
      value          = ""
      wildcard_match = false
    }
  }
}
