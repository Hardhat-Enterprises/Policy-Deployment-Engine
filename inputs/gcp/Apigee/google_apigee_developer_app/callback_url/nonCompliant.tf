resource "google_apigee_developer_app" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  app_family      = "default"
  developer_email = "example@deakin.edu.au"
  org_id          = "PDE-Apigee-Org"
  callback_url    = ""
  key_expires_in  = "-1"
  status          = "approved"

  api_products = ["my-app"]

  attributes {
    name  = "Department"
    value = "Development"
  }
}
