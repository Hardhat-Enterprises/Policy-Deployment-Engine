
resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "nc"
  project            = "smooth-verve-467716-v1"
  application_id      = "nc"
  endpoint_matchers {
    hostname = "svc.corp.example.com"
  }
  upstreams {
    egress_policy { 
      regions = ["us-central1"]
    }
    network {
      name = "projects/1d/location/project/dev-scratch"
    }
  }
}
