resource "google_ces_app" "compliant_example_1" {
  app_id       = "my-app"
  location     = "us"
  display_name = "my-app"

  guardrails = [
    "approved-guardrail"
  ]
}