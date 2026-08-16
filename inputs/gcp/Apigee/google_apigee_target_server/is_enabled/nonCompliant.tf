# Tests the is_enabled argument of google_apigee_target_server.
# false is non-compliant because the target server is unavailable for API traffic.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "disabled-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  is_enabled = false
}