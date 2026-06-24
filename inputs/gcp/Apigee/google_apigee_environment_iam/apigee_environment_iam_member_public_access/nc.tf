resource "google_apigee_environment_iam_member" "nc" {
  org_id = "organizations/pde-org"
  env_id = "nc"
  role   = "roles/viewer"
  member = "allUsers"
}
