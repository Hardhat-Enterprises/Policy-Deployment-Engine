resource "google_ces_agent" "compliant_example_1" {
  agent_id     = "agent-1"
  display_name = "example-agent"
  app          = "fake-app"
  location     = "australia-southeast1"

  after_model_callbacks {
    description = "Example callback"
    disabled    = false
    python_code = "def after_model_callback(callback_context, llm_response): return None"
  }
}

