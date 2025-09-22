data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_container_attached_cluster" "c" {
  name            = "c"
  project         = data.google_project.project.project_id
  location        = "australia-southeast1"
  distribution    = "aks"
  platform_version = "1.27.3-gke.100"

  oidc_config {
    issuer_url = "https://oidc.issuer.url"
  }

  fleet {
    project = "projects/${data.google_project.project.number}"
  }
}
