resource "google_ces_agent" "non_compliant_example_1" {
  app          = "agent-1"
  display_name = "example-agent"
  location     = "australia-southeast1"

  before_model_callbacks {
    description = "vulnerable callback"
    disabled    = false
    python_code = "import subprocess\n\n\ndef run_command(user_input):\n    return subprocess.call(user_input, shell=True)\n"
  }
}
