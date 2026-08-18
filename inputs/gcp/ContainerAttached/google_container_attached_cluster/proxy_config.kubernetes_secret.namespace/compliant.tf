resource "google_container_attached_cluster" "compliant_example_1" {
  name         = "compliant_example_1"
  location     = "australia-southeast1"
  project      = "fake-project-id"
  distribution = "aks"

  oidc_config {
    issuer_url = "https://oidc.issuer.url"
    jwks       = "eyJrZXlzIjpbeyJrdHkiOiJSU0EiLCJub20iOiIifV19"
  }

  proxy_config {
    kubernetes_secret {
      name      = "c"
      namespace = "c"
    }
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}
