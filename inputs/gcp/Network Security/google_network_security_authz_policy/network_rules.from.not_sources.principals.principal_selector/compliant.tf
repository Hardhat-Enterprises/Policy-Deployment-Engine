resource "google_network_security_authz_policy" "compliant_example_1" {
  name           = "compliant-example-1"
  project        = "example-project"
  location       = "us-west1"
  action         = "ALLOW"
  policy_profile = "REQUEST_AUTHZ"

  target {
    load_balancing_scheme = "INTERNAL_MANAGED"
    resources = ["projects/example-project/locations/us-west1/gateways/example-gateway"]
  }

  network_rules {
    from {
      not_sources {
        principals {
          principal_selector = "CLIENT_CERT_URI_SAN"
          principal {
            exact = "spiffe://example.com/ns/default/sa/app"
          }
        }
      }
    }

    to {
      operations {
        snis {
          exact = "example.com"
        }
      }
    }
  }
}
