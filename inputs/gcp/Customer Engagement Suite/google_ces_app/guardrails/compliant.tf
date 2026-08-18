resource "google_ces_app" "compliant_example_1" {
  app_id       = "app-id"
  location     = "us"
  description  = "Basic CES App example"
  display_name = "my-app"
  
  guardrails   = [
    "projects/my-project/locations/us/apps/my-app/guardrails/approved-guardrail"
  ]
}