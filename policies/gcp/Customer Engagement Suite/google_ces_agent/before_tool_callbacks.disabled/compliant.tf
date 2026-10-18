resource "google_ces_agent" "compliant_example_1" {
  agent_id     = "agent-1"
  display_name = "example-agent"
  app          = "example-app"
  location     = "australia-southeast1"

  before_tool_callbacks {
    description = "Example callback"
    disabled    = false
    python_code = "def before_tool_callback(tool, input, callback_context): return None"
  }
}

