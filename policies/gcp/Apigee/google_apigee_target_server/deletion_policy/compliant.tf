# Tests the deletion_policy argument of google_apigee_target_server.
# PREVENT is compliant because it protects the target server from deletion.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "secure-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  deletion_policy = "PREVENT"
}