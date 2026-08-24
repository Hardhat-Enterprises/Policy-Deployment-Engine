resource "google_ces_app" "compliant_example_1" {
  app_id       = "my-app"
  location     = "us"
  display_name = "compliant-app"

  guardrails = [
    "projects/my-project/locations/us/apps/my-app/guardrails/approved-guardrail"
  ]
}