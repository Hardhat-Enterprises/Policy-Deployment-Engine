resource "google_ces_agent" "compliant_example_1" {
  app          = "agent-1"
  display_name = "example-agent"
  location     = "australia-southeast1"

  before_agent_callbacks {
    description = "secure callback"
    disabled    = false
    python_code = "def callback(event): return event"
  }
}
