resource "google_ces_app" "compliant_example_1" {
  app_id              = "app-id"
  location            = "us"
  description         = "Basic CES App example"
  display_name        = "my-app"
  tool_execution_mode = "SEQUENTIAL"
}