
resource "google_beyondcorp_security_gateway" "sg" {
  security_gateway_id = "c"
  project = "smooth-verve-467716-v1"
  hubs { 
    region = "australia-southeast1" 
  }
}

resource "google_beyondcorp_security_gateway_application" "sga" {
  security_gateway_id = google_beyondcorp_security_gateway.sg.security_gateway_id
  project            = google_beyondcorp_security_gateway.sg.project
  application_id = "c"
  endpoint_matchers {
    hostname = "google.com"
    ports = [80, 443]
  }
}

resource "google_beyondcorp_security_gateway_application_iam_binding" "c" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sga.security_gateway_id
  project = google_beyondcorp_security_gateway_application.sga.project
  application_id = google_beyondcorp_security_gateway_application.sga.application_id
  role = "roles/beyondcorp.securityGatewayUser"
  members = [
    "user:jane@example.com"
  ]
}
