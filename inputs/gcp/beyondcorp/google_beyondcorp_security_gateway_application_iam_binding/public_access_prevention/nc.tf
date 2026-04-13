
resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  project             = "smooth-verve-467716-v1"
  hubs {
    region = "us-central1"
  }
}

resource "google_beyondcorp_security_gateway_application" "sga_nc" {
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  project             = google_beyondcorp_security_gateway.sg_nc.project
  application_id      = "nc"
  endpoint_matchers {
    hostname = "google.com"
    ports    = ["443", "8443", "9443"]
  }

}

resource "google_beyondcorp_security_gateway_application_iam_binding" "nc" {
  security_gateway_id = google_beyondcorp_security_gateway_application.sga_nc.security_gateway_id
  application_id      = google_beyondcorp_security_gateway_application.sga_nc.application_id
  project             = google_beyondcorp_security_gateway_application.sga_nc.project
  role                = "roles/beyondcorp.securityGatewayUser"
  members = [
    "allAuthenticatedUsers"
  ]
}