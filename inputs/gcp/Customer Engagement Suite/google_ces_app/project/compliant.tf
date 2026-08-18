resource "google_ces_app" "compliant_example_1" {
  app_id             = "app-id"
  project            = "my-project"
  location           = "us"
  description        = "Basic CES App example"
  display_name       = "my-app"
  global_instruction = "Follow approved safety and data handling requiremnets."
}