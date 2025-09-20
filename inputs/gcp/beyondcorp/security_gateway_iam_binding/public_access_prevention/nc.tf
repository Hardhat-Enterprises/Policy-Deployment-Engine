data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway" "sg_nc" {
  security_gateway_id = "nc"
  project = data.google_project.project_nc.project_id

  hubs { 
    region = "australia-southeast1" 
  }
}

resource "google_beyondcorp_security_gateway_iam_binding" "nc" {
  project = google_beyondcorp_security_gateway.sg_nc.project
  security_gateway_id = google_beyondcorp_security_gateway.sg_nc.security_gateway_id
  role = "roles/beyondcorp.securityGatewayUser"
  members = [
    "allAuthenticatedUsers",
  ]
}