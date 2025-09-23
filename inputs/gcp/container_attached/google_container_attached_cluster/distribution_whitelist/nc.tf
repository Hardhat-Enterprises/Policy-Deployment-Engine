data "google_project" "project_nc" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_container_attached_cluster" "nc" {
  name            = "nc"
  project      = data.google_project.project_nc.project_id
  location     = "us-west1"
  distribution = "jwks"
  oidc_config {
    issuer_url = "https://accounts.google.com"
  }
  platform_version = "123.55-bad-version"
  fleet { project = "projects/${data.google_project.project_nc.number}" }
}