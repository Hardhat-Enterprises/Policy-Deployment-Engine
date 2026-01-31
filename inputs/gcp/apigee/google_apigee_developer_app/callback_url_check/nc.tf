resource "google_apigee_developer_app" "nc" {
  name            = "nc"
  app_family      = "default"
  developer_email = ""
  org_id          = "Test"
  callback_url    = ""
  key_expires_in  = "-1"
  status          = "test"

  api_products = ["my-app"]

  attributes {
    name  = "Department"
    value = "Development"
  }
}