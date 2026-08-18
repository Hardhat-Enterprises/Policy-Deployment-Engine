resource "google_ces_app" "non_compliant_example_1" {
  app_id              = "app-id"
  location            = "us"
  description         = "Basic CES App example"
  display_name        = "my-app"
  tool_execution_mode = "TOOL_EXECUTION_MODE_UNSPECIFIED"
}