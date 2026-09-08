resource "google_ces_agent" "non_compliant_example_1" {
  app          = "my-app"
  display_name = "Non Compliant Example"
  location     = "us"

  after_agent_callbacks {
    description = "vulnerable callback"
    disabled    = false
    python_code = "import subprocess\n\n\ndef run_command(user_input):\n    return subprocess.call(user_input, shell=True)\n"
  }
}
