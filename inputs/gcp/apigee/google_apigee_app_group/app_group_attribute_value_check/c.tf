resource "google_apigee_app_group" "c" {
  name         = "my-app-group-c"
  display_name = "Test app group"
  channel_id   = "storefront"
  channel_uri  = "https://my-dev-portal.org/groups/my-group"
  status       = "active"
  org_id       = "PDE-Apigee-Org"

  attributes {
    name = "Department"
    value = "Development"
  }
}