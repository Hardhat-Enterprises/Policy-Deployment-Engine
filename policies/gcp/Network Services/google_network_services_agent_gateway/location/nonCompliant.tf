resource "google_network_services_agent_gateway" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  location = "us-central1"

  google_managed {
    governed_access_path = "CLIENT_TO_AGENT"
  }
}