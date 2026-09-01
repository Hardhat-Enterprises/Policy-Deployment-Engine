resource "google_network_services_lb_route_extension" "non_compliant_example_1" {
  name     = "noncompliant-lb-route-extension"
  project  = "test-project"
  location = "australia-southeast1"

  forwarding_rules = [
    "projects/test-project/regions/australia-southeast1/forwardingRules/test-forwarding-rule"
  ]

  load_balancing_scheme = "INTERNAL_MANAGED"
  deletion_policy       = "DELETE"

  extension_chains {
    name = "chain-1"

    match_condition {
      cel_expression = "true"
    }

    extensions {
      name            = "extension-1"
      service         = "projects/test-project/regions/australia-southeast1/backendServices/test-backend"
      fail_open       = false
      forward_headers = ["X-Request-Id", "X-Correlation-Id"]
    }
  }
}
