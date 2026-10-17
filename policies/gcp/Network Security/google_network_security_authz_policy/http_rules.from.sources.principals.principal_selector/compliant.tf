resource "google_network_security_authz_policy" "compliant_example_1" {
  name     = "compliant-example-1"
  project  = "example-project"
  location = "us-west1"
  action   = "ALLOW"

  target {
    load_balancing_scheme = "INTERNAL_MANAGED"
    resources = ["projects/example-project/regions/us-west1/forwardingRules/example-forwarding-rule"]
  }

  http_rules {
    from {
      sources {
        principals {
          principal {
            exact = "spiffe://example.com/ns/default/sa/app"
          }
        }
      }
    }

    to {
      operations {
        methods = ["GET"]
      }
    }
  }
}
