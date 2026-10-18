resource "google_apigee_environment_iam_member" "compliant_example_1" {
  org_id = "organizations/pde-org"
  env_id = "compliant_example_1"
  role   = "roles/viewer"
  member = "user:jane@example.com"
}
