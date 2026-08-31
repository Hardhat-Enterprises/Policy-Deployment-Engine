resource "google_ces_app" "non_compliant_example_1" {
  app_id       = "my-app"
  location     = "us"
  display_name = "my-app"

  guardrails = [
    "unapproved-guardrail"
  ]
}