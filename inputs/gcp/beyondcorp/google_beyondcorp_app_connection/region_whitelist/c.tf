data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_app_connection" "c" {
  name = "c"
  project = data.google_project.project.id
  type = "TCP_PROXY"
  region = "australia-southeast1"
  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
