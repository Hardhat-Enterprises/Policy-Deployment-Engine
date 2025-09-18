data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "c"
  project = data.google_project.project.project_id
  application_id = "c"
  endpoint_matchers {
    hostname = "web.corp.example.com"
    ports = [443 , 8443]
  }
}
