resource "google_ces_agent" "non_compliant_example_1" {
  agent_id     = "agent-1"
  display_name = "example-agent"
  app          = "fake-app"
  location     = "australia-southeast1"

   before_model_callbacks {
    description = "Example callback"
    disabled    = true
    python_code = "def before_model_callback(callback_context, llm_request): return None"
  }
}