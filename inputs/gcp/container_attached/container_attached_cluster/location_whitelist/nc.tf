data "google_project" "project_nc" {
  project_id        = "smooth-verve-467716-v1"
}
resource "google_container_attached_cluster" "nc" {
  name         = "nc-us-01"
  project      = data.google_project.project_nc.project_id
  location     = "us-west1"
  distribution    = "nc_distro"
  platform_version = "123.55-bad-version"
  oidc_config { 
    issuer_url = "https://issuer.oidc.corp.example.com"
  }

  fleet { 
    project = "projects/${data.google_project.project.number}"
  }
}
