resource "google_apigee_environment_iam_member" "non_compliant_example_1" {
  org_id = "organizations/pde-org"
  env_id = "non_compliant_example_1"
  role   = "roles/viewer"
  member = "allUsers"
}
