# Tests the s_sl_info.enabled argument of google_apigee_target_server.
# true is compliant because TLS is enabled for backend communication.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "tls-enabled-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled = true
  }
}
