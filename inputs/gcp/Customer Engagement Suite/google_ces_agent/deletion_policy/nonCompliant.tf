resource "google_ces_agent" "non_compliant_example_1" {
  agent_id     = "test-agent"
  app          = "fake-app"
  location     = "australia-southeast1"
  display_name = "Test Agent"
  deletion_policy = "DELETE"
}