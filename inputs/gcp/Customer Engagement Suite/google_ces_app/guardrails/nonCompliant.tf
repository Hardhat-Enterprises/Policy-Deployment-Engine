resource "google_ces_app" "non_compliant_example_1" {
  app_id       = "app_id"
  location     = "us"
  display_name = "my-app"

  guardrails = []
}
