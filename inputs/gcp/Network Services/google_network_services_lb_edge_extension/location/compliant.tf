resource "google_network_services_lb_edge_extension" "compliant_example_1" {
  name     = "compliant-lb-edge-extension"
  location = "australia-southeast1"

  forwarding_rules = [
    "projects/test-project/regions/global/forwardingRules/test-forwarding-rule"
  ]

  load_balancing_scheme = "EXTERNAL_MANAGED"

  extension_chains {
    name = "chain-1"

    match_condition {
      cel_expression = "true"
    }

    extensions {
      name    = "extension-1"
      service = "projects/test-project/global/backendServices/test-backend"
    }
  }
}

