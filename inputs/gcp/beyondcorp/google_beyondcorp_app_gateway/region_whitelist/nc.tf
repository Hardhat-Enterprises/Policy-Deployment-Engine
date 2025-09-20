data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_beyondcorp_app_gateway" "nc" {
  name         = "nc"
  project      = data.google_project.project_nc.project_id
  type         = "TCP_PROXY"
  host_type    = "GCP_REGIONAL_MIG"
  region       = "us-central1"
}
