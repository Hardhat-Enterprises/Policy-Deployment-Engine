resource "google_network_security_authz_policy" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  project  = "example-project"
  location = "us-west1"
  action   = "ALLOW"
  deletion_policy = "DELETE"

  target {
    load_balancing_scheme = "INTERNAL_MANAGED"
    resources = ["projects/example-project/regions/us-west1/forwardingRules/example-forwarding-rule"]
  }

  http_rules {
    to {
      operations {
        methods = ["GET"]
      }
    }
  }
}
