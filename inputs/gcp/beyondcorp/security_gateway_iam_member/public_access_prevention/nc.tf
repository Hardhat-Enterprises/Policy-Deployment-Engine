resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  display_name = "My Security Gateway resource"
  hubs { 
    region = "us-central1" 
  }
}

resource "google_beyondcorp_security_gateway_iam_member" "nc" {
  project = google_beyondcorp_security_gateway.sg_nc.project
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  role = "roles/beyondcorp.securityGatewayUser"
  member = "allUsers"
}