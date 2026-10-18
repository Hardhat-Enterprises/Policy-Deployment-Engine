# Tests the protocol argument of google_apigee_target_server.
# HTTP2 is included in the approved protocol list.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "approved-protocol-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP2"
  env_id   = "organizations/example-org/environments/test"
}
