
resource "google_beyondcorp_security_gateway" "sg" {
  security_gateway_id = "c"
  project = "smooth-verve-467716-v1"
  hubs { 
    region = "australia-southeast1" 
  }
}

resource "google_beyondcorp_security_gateway_application" "sgp" {
  security_gateway_id = google_beyondcorp_security_gateway.sg.security_gateway_id
  project = google_beyondcorp_security_gateway.sg.project
  application_id = "c"
  endpoint_matchers {
    hostname = "google.com"
  }
}

resource "google_beyondcorp_security_gateway_application_iam_member" "c" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sgp.security_gateway_id
  application_id = google_beyondcorp_security_gateway_application.sgp.application_id
  project = google_beyondcorp_security_gateway_application.sgp.project
  role = "roles/beyondcorp.securityGatewayUser"
  member = "user:jane@example.com"
}