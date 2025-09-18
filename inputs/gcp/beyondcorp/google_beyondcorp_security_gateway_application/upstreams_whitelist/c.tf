data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "c"
  application_id      = "c"
  project            = data.google_project.project.project_id
  endpoint_matchers {
    hostname = "svc.corp.example.com"
  }
  upstreams {
    egress_policy {
      regions = ["australia-southeast1"]
    }
    network {
      name = "projects/${data.google_project.project.project_id}/global/networks/prod-vpc"
    }
  }
}
