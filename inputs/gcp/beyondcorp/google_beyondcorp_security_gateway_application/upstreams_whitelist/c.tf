data "google_project" "c" {}

resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "c-default-sg"
  application_id      = "c-app-upstream-01"
  endpoint_matchers {
    hostname = "svc.corp.example.com"
  }
  upstreams {
    egress_policy {
      regions = ["australia-southeast1"]
    }
    network {
      name = "projects/${data.google_project.c.project_id}/global/networks/prod-vpc"
    }
  }
}
