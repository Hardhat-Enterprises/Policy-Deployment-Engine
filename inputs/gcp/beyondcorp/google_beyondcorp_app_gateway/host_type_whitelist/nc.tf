data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_app_gateway" "nc" {
  name = "nc"
  project = data.google_project.project.project_id
  region = "australia-southeast1"
  type = "TCP_PROXY"
  host_type = "HOST_TYPE_UNSPECIFIED"
}
