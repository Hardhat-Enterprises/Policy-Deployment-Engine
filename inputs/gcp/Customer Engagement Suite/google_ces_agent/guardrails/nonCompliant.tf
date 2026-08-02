resource "google_ces_agent" "non_compliant_example_1" {
  agent_id         = "agent-1"
  display_name     = "example-agent"
  app              = "example-app"
  location         = "australia-southeast1"

  guardrails = [
  "projects/example-project/locations/australia-southeast1/apps/example-app/guardrails/unapproved-guardrail"
]
   

}