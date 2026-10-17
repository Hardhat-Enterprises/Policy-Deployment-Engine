# Tests the s_sl_info.enabled argument of google_apigee_target_server.
# false is non-compliant because TLS is disabled for backend communication.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "tls-disabled-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled = false
  }
}
