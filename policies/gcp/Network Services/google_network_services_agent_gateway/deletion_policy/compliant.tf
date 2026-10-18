resource "google_network_services_agent_gateway" "compliant_example_1" {
  name     = "compliant-example-1"
  location = "australia-southeast1"

  google_managed {
    governed_access_path = "CLIENT_TO_AGENT"
  }

  deletion_policy = "PREVENT"
}