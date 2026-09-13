resource "google_apigee_developer_app" "compliant_example_1" {
  org_id          = "organizations/PDE-Apigee-Project"
  developer_email = "developer@example.com"
  name            = "compliant-app"
  callback_url    = "https://example.com/callback"
  key_expires_in  = "2592000000"
}
