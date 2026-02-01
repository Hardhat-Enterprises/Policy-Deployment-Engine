resource "google_apigee_developer_app" "c" {
  name            = "c"
  app_family      = "default"
  developer_email = "example@deakin.edu.au"
  org_id          = "PDE-Apigee-Org"
  callback_url    = "https://example-call.url"
  key_expires_in  = "-1"
  status          = "approved"

  api_products = ["my-app"]

  attributes {
    name  = "Department"
    value = "Development"
  }
}