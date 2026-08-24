resource "google_ces_app" "non_compliant_example_1" {
  app_id       = "my-app"
  location     = "us"
  display_name = "non-compliant-app"

  guardrails = [
    "projects/my-project/locations/us/apps/my-app/guardrails/unapproved-guardrail"
  ]
}