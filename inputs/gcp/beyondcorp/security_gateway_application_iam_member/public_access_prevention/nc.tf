resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  display_name = "My Security Gateway resource"
  hubs { 
    region = "us-central1" 
  }
}

resource "google_beyondcorp_security_gateway_application" "sgp_nc" {
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  application_id = "nc"
  endpoint_matchers {
    hostname = "google.com"
  }
}

resource "google_beyondcorp_security_gateway_application_iam_member" "nc" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sgp_nc.security_gateway_id
  application_id = google_beyondcorp_security_gateway_application.sgp_nc.application_id
  role = "roles/beyondcorp.securityGatewayUser"
  member = "allUsers"
}