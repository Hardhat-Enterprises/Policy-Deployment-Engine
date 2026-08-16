# Tests the is_enabled argument of google_apigee_target_server.
# true is compliant because the target server is enabled for API traffic.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "enabled-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  is_enabled = true
}