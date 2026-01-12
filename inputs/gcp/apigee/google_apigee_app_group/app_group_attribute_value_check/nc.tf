resource "google_apigee_app_group" "nc" {
  name         = "my-app-group-nc"
  display_name = ""
  channel_id   = "storefront"
  channel_uri  = "https://my-dev-portal.org/groups/my-group"
  status       = "active"
  org_id       = "PDE-Org"

  attributes {
    name = "Department"
    value = "Test"
  }
}