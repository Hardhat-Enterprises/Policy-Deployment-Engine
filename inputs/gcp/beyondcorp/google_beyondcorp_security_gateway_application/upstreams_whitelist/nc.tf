data "google_project" "nc" {}

resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "nc-default-sg"
  application_id      = "nc-app-upstream-01"
  endpoint_matchers { 
    hostname = "svc.corp.example.com"
  }
  upstreams {
    egress_policy { 
      regions = ["us-central1"]
    }
    network {
      name = "projects/${data.google_project.nc.project_id}/global/networks/dev-scratch"
    }
  }
}
