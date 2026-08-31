resource "google_ces_app" "compliant_example_1" {
  app_id       = "app_id"
  location     = "us"
  display_name = "my-app"

  guardrails = [
    "projects/*/locations/*/apps/*/guardrails/*"
  ]
}