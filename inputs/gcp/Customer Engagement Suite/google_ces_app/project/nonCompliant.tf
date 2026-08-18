resource "google_ces_app" "non_compliant_example_1" {
  app_id       = "app-id"
  project      = "unapproved-project"
  location     = "us"
  description  = "Basic CES App example"
  display_name = "my-app"
}