resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  display_name = "nc-My Security Gateway resource"
  hubs { 
    region = "us-central1" 
  }
}

resource "google_beyondcorp_security_gateway_application" "sga_nc" {
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  application_id = "nc"
  endpoint_matchers {
    hostname = "google.com"
  }
}

resource "google_beyondcorp_security_gateway_application_iam_binding" "nc" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sga_nc.security_gateway_id
  application_id = google_beyondcorp_security_gateway_application.sga_nc.application_id
  role = "roles/beyondcorp.securityGatewayUser"
  members = [
    "allAuthenticatedUsers"
  ]
}