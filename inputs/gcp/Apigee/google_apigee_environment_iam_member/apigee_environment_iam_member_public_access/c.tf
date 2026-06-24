resource "google_apigee_environment_iam_member" "c" {
  org_id = "organizations/pde-org"
  env_id = "c"
  role   = "roles/viewer"
  member = "user:jane@example.com"
}
