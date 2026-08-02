resource "google_ces_agent" "non_compliant_example_1" {
  agent_id     = "agent-1"
  display_name = "example-agent"
  app          = "fake-app"
  location     = "australia-southeast1"

   after_agent_callbacks {
    description = "Example callback"
    disabled    = true
    python_code = "def callback(callback_context): return None"
  }
}