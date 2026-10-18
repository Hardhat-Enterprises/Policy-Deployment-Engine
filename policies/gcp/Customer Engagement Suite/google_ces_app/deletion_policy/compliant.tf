resource "google_ces_app" "compliant_example_1" {
  app_id          = "app-id"
  location        = "europe"
  description     = "Basic CES App example"
  display_name    = "my-app"
  pinned          = true
  deletion_policy = "PREVENT"
}