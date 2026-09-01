resource "google_beyondcorp_security_gateway_application" "non_compliant_example_1" {
  security_gateway_id = "c"
  project            = "smooth-verve-467716-v1"
  application_id      = "non_compliant_example_1"
  endpoint_matchers {
    hostname = "svc.corp.example.com"
    ports    = [443]
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
