data "google_project" "project" {
  project_id = "smooth-verve-467716-v1"
}

resource "google_container_attached_cluster" "c" {
  name         = "ac-oidc-ok"
  project      = data.google_project.project.project_id
  location     = "australia-southeast1"
  distribution = "aks"
  oidc_config {
    issuer_url = "https://issuer.oidc.corp.example.com"
    jwks       = base64encode("{\"keys\":[{\"kty\":\"RSA\",\"e\":\"AQAB\",\"n\":\"...\"}]}")
  }
  platform_version = "1.27.3-gke.100"
  fleet { project = "projects/${data.google_project.project.number}" }
}
