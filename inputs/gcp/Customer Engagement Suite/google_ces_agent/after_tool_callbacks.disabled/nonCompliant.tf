resource "google_ces_agent" "non_compliant_example_1" {
  agent_id     = "agent-1"
  display_name = "example-agent"
  app          = "fake-app"
  location     = "australia-southeast1"

   after_tool_callbacks {
    description = "Example callback"
    disabled    = true
    python_code = "def after_tool_callback(tool, input, callback_context, tool_response): return None"
  }
}