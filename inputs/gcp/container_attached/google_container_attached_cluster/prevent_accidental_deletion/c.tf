resource "google_container_attached_cluster" "c" {
  name         = "c"
  location     = "australia-southeast1"
  project      = "fake-project-id"
  distribution = "aks"

  deletion_policy = "DELETE"

  oidc_config {
    issuer_url = "https://oidc.issuer.url"
    jwks       = "eyJrZXlzIjpbeyJrdHkiOiJSU0EiLCJub20iOiIifV19"
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}