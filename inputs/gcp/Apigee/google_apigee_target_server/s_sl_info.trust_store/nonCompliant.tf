# Tests the s_sl_info.trust_store argument.
# The truststore is non-compliant because it is empty.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "unapproved-truststore-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled                  = true
    enforce                  = true
    ignore_validation_errors = false
    trust_store              = ""
  }
}
