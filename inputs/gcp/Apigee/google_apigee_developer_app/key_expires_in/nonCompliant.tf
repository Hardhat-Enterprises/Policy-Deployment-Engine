resource "google_apigee_developer_app" "non_compliant_example_1" {
  org_id          = "organizations/PDE-Apigee-Project"
  developer_email = "developer@example.com"
  name            = "noncompliant-app"
  callback_url    = "https://example.com/callback"
  key_expires_in  = "-1"
}
