resource "google_network_services_agent_gateway" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  location = "australia-southeast1"

  google_managed {
    governed_access_path = "AGENT_TO_ANYWHERE"
  }
}