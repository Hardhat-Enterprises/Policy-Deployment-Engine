data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  project = data.google_project.project_nc.project_id
  hubs { 
    region = "us-central1" 
  }
}

resource "google_beyondcorp_security_gateway_application" "sgp_nc" {
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  application_id = "nc"
  project = data.google_project.project_nc.project_id
  endpoint_matchers {
    hostname = "google.com"
  }
}

resource "google_beyondcorp_security_gateway_application_iam_member" "nc" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sgp_nc.security_gateway_id
  application_id = google_beyondcorp_security_gateway_application.sgp_nc.application_id
  project = data.google_project.project_nc.project_id
  role = "roles/beyondcorp.securityGatewayUser"
  member = "allUsers"
}