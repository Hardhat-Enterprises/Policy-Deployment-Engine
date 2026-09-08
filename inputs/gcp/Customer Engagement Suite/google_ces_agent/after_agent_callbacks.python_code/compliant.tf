resource "google_ces_agent" "compliant_example_1" {
  app          = "my-app"
  display_name = "Compliant Example"
  location     = "us"

  after_agent_callbacks {
    description = "secure callback"
    disabled    = false
    python_code = "def callback(event): return event"
  }
}
