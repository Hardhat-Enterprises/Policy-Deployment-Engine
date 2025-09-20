data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "nc"
  project = data.google_project.project_nc.project_id
  application_id = "nc"
  endpoint_matchers {
    hostname = "web.external.net"
    ports = [22, 8080]
  }
}
