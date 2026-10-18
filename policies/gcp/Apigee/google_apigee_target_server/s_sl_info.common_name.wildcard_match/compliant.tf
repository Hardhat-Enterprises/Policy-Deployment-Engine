# Tests the s_sl_info.common_name.wildcard_match argument.
# false is compliant because it requires an exact common-name match.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "exact-name-match-target-server"
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
      value          = "backend.example.com"
      wildcard_match = false
    }
  }
}
