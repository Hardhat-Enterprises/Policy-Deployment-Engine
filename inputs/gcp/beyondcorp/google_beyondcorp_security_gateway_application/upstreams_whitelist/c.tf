
resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "c"
  application_id      = "c"
  project            = "smooth-verve-467716-v1"
  endpoint_matchers {
    hostname = "svc.corp.example.com"
  }
  upstreams {
    egress_policy {
      regions = ["australia-southeast1"]
    }
    network {
      name = "projects/smooth-verve-467716-v1/global/networks/prod-vpc"
    }
  }
}
