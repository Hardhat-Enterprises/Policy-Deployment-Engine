
resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  project             = "smooth-verve-467716-v1"
  hubs {
    region = "us-central1"
  }
}

resource "google_beyondcorp_security_gateway_application" "sgp_nc" {
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  application_id      = "nc"
  project             = google_beyondcorp_security_gateway.sg_nc.project
  endpoint_matchers {
    hostname = "google.com"
    ports    = [80, 443]
  }
}

resource "google_beyondcorp_security_gateway_application_iam_member" "nc" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sgp_nc.security_gateway_id
  application_id      = google_beyondcorp_security_gateway_application.sgp_nc.application_id
  project             = google_beyondcorp_security_gateway_application.sgp_nc.project
  role                = "roles/beyondcorp.securityGatewayUser"
  member              = "allUsers"
}