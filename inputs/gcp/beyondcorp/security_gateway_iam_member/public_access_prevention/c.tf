data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway" "sg"{
  security_gateway_id = "c"
  project = data.google_project.project.project_id
  hubs { 
    region = "australia-southeast1" 
  }
}

resource "google_beyondcorp_security_gateway_iam_member" "c" {
  project = google_beyondcorp_security_gateway.sg.project
  security_gateway_id = google_beyondcorp_security_gateway.sg.security_gateway_id
  role = "roles/beyondcorp.securityGatewayUser"
  member = "user:jane@example.com"
}