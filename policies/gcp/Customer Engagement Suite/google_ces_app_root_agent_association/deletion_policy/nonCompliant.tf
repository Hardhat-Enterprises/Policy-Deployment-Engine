resource "google_ces_app_root_agent_association" "non_compliant_example_1" {
  location = "australia-southeast1"
  app_id = "example-app"
  agent_id = "example-agent"
  deletion_policy = "DELETE"
}