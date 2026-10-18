# Tests the deletion_policy argument of google_apigee_target_server.
# DELETE is non-compliant because it allows Terraform to delete the resource.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "insecure-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  deletion_policy = "DELETE"
}