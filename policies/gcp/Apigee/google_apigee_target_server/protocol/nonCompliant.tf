# Tests the protocol argument of google_apigee_target_server.
# HTTP is not included in the approved protocol list.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "unapproved-protocol-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"
}
