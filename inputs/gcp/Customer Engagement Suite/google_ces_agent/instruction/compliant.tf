resource "google_ces_agent" "compliant_example_1" {
  agent_id     = "agent-1"
  display_name = "example-agent"
  app          = "example-app"
  location     = "australia-southeast1"

  instruction = "You are a helpful assistant. Follow company security guidelines."
}