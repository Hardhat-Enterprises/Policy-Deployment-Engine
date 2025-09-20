data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_security_gateway" "c" {
  security_gateway_id = "c"
  project             = data.google_project.project.project_id
  hubs { 
    region = "australia-southeast1" 
  }
}
