data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway" "nc" {
  security_gateway_id = "nc"
  project             = data.google_project.project_nc.project_id
  hubs { 
    region = "us-central1" 
  }
}
