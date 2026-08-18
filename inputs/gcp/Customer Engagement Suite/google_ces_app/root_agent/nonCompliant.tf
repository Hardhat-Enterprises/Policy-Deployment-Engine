resource "google_ces_app" "non_compliant_example_1" {
  app_id             = "app-id"
  location           = "us"
  description        = "Basic CES App example"
  display_name       = "my-app"
  
  root_agent = "projects/my-project/locations/us/apps/my-app/agents/unapproved-root_agent"
}