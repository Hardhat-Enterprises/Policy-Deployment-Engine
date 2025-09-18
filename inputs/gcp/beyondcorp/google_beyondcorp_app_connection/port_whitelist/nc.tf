data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_app_connection" "nc" {
  name         = "nc"
  project      = data.google_project.project_nc.id
  type         = "TCP_PROXY"
  region       = "australia-southeast1"
  application_endpoint {
    host = "svc.internal"
    port = 8081
  }
}
